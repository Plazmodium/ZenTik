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
    var cryptoModel = [CryptoModel]()
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

        mainViewModel.getTheAssets(apiKey: "71B66932-911E-42E3-BC37-862D30F51883") { (data) in
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
        
        cryptoCell.cryptoName.text = cryptoModel[indexPath.row].name
        cryptoCell.cryptoAbbreviation.text = cryptoModel[indexPath.row].asset_id
        cryptoCell.cryptoInceptionDate.text = cryptoModel[indexPath.row].dateStarted
        
        return cryptoCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        var height = CGFloat()
        height = 114.00

        return height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
