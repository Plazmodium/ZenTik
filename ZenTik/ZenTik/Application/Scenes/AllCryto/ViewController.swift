//
//  ViewController.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //MARK: IBOUTLETS
    @IBOutlet weak var cryptoTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!{
        didSet{
            searchBar.placeholder = "SEARCH COINS"
            searchBar.delegate = self
        }
    }
    @IBOutlet weak var rightSideBarButtonItem: UIBarButtonItem!
    
    //MARK: PROPERTIES
    var getCryptoCurrenciesUseCase = GetCryptoCurrenciesConcrete()
    var mainViewModel : MainViewModel!
    var tableIndex:Int!
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        loadingIndicator()
        launchNetworkCall()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(Auth.auth().currentUser == nil){
            self.rightSideBarButtonItem.title = "Register"
        }
        
        //setup tableview delegates
        self.cryptoTableView.delegate = self
        self.cryptoTableView.dataSource = self
        
        self.searchBar.backgroundColor = UIColor.clear
        self.searchBar.isTranslucent = true
    }
    
    func launchNetworkCall() {
        
        self.mainViewModel = MainViewModel(getCrypoCoins: self.getCryptoCurrenciesUseCase, completionHandler: {
            self.cryptoTableView.reloadData()
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    //MARK: SEARCHBAR DELEGATES
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if(searchText.isEmpty){
            loadingIndicator()
            launchNetworkCall()
        }else{
            let searchedData = self.mainViewModel.cryptoModelCryptoCompare.filter { (data) -> Bool in
                data.coinName.lowercased().contains(searchText.lowercased())
            }
            
            self.mainViewModel.cryptoModelCryptoCompare = searchedData
            cryptoTableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    //MARK: NAVIGATION CONTROL TO COIN'S DETAIL
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "toCryptoDetail"){
            
            let cryptoDetailController = segue.destination as! CryptoDetailViewController
            if let indexPath = self.cryptoTableView.indexPathForSelectedRow?.row{
                
                cryptoDetailController.cryptoName = self.mainViewModel.cryptoModelCryptoCompare[indexPath].coinName
                cryptoDetailController.coinImageUrl = self.mainViewModel.cryptoModelCryptoCompare[indexPath].imageURL
                cryptoDetailController.cryptoSymbol = self.mainViewModel.cryptoModelCryptoCompare[indexPath].symbol
                cryptoDetailController.cryptoPoT = self.mainViewModel.cryptoModelCryptoCompare[indexPath].proofType
                cryptoDetailController.cryptoAlgo = self.mainViewModel.cryptoModelCryptoCompare[indexPath].algorithm
            }
        }
    }
    
    //MARK: TABLEVIEW DELEGATES
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.cryptoModelCryptoCompare.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cryptoCell = tableView.dequeueReusableCell(withIdentifier: "MainViewCell") as! MainViewTableViewCell

        let theData = mainViewModel.cryptoModelCryptoCompare[indexPath.row]
        
        let urls = "https://www.cryptocompare.com\(theData.imageURL ?? "" )"
        
        cryptoCell.cryptoName.text = theData.coinName
        cryptoCell.cryptoAbbreviation.text = theData.symbol
        cryptoCell.algorithm.text = theData.algorithm
        cryptoCell.cryptoProofType.text = theData.proofType
        cryptoCell.fullyPremined.text = theData.fullyPremined
        cryptoCell.preminedValue.text = theData.preMinedValue
        cryptoCell.totalCoinSupply.text = theData.totalCoinSupply
        cryptoCell.totalCoinsFreeFloating.text = theData.totalCoinsFreeFloat
        cryptoCell.cryptoImage.downloadedFrom(link: urls)
        
        if(theData.sponsored == true){
            cryptoCell.cryptoSponsored.text = "YES"
            cryptoCell.cryptoSponsored.textColor = UIColor.green
            
        }else{
            cryptoCell.cryptoSponsored.text = "NO"
            cryptoCell.cryptoSponsored.textColor = UIColor.red
        }
        
        if(theData.isTrading == true){
            cryptoCell.cryptoTrading.text = "YES"
            cryptoCell.cryptoTrading.textColor = UIColor.green
            
        }else{
            cryptoCell.cryptoTrading.text = "NO"
            cryptoCell.cryptoTrading.textColor = UIColor.red
        }
        
        return cryptoCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = CGFloat()
        height = 271.00
        
        return height
    }
    
    @IBAction func logoutToolbarBTN(_ sender: UIBarButtonItem) {
        
        if(Auth.auth().currentUser != nil){
           try? Auth.auth().signOut()
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let toLandingVC = storyBoard.instantiateViewController(withIdentifier: "LandingViewController") as! LandingViewController
            self.show(toLandingVC, sender: nil)
        }else{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let toLandingVC = storyBoard.instantiateViewController(withIdentifier: "LandingViewController") as! LandingViewController
            self.show(toLandingVC, sender: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
