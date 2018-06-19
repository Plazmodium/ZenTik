//
//  ViewController.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: IBOUTLETS
    @IBOutlet weak var cryptoTableView: UITableView!
    
    //MARK: PROPERTIES
    var cryptoModel = [CryptoModelCryptoCompare]()
    var mainViewModel = MainViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        launchNetworkCall()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup tableview delegates
        self.cryptoTableView.delegate = self
        self.cryptoTableView.dataSource = self
    }
    
    func launchNetworkCall() {

        mainViewModel.getTheAssets() { (data) in
            self.cryptoModel = data
            self.cryptoTableView.reloadData()
        }
    }
    
    //MARK: TABLEVIEW DELEGATES
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cryptoCell = tableView.dequeueReusableCell(withIdentifier: "MainViewCell") as! MainViewTableViewCell
        
        let urls = "https://www.cryptocompare.com\(cryptoModel[indexPath.row].imageURL ?? "" )"
        
        cryptoCell.cryptoName.text = cryptoModel[indexPath.row].coinName
        cryptoCell.cryptoAbbreviation.text = cryptoModel[indexPath.row].symbol
        cryptoCell.algorithm.text = cryptoModel[indexPath.row].algorithm
        cryptoCell.cryptoProofType.text = cryptoModel[indexPath.row].proofType
        cryptoCell.fullyPremined.text = cryptoModel[indexPath.row].fullyPremined
        cryptoCell.preminedValue.text = cryptoModel[indexPath.row].preMinedValue
        cryptoCell.totalCoinSupply.text = cryptoModel[indexPath.row].totalCoinSupply
        cryptoCell.totalCoinsFreeFloating.text = cryptoModel[indexPath.row].totalCoinsFreeFloat
        cryptoCell.cryptoImage.downloadedFrom(link: urls)
        
        if(cryptoModel[indexPath.row].sponsored == true){
            cryptoCell.cryptoSponsored.text = "YES"
            cryptoCell.cryptoSponsored.textColor = UIColor.green
            
        }else{
            cryptoCell.cryptoSponsored.text = "NO"
            cryptoCell.cryptoSponsored.textColor = UIColor.red
        }
        
        if(cryptoModel[indexPath.row].isTrading == true){
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
