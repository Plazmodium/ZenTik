//
//  AllCryptoCollectionViewController.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/10/28.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AllCryptoCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var getCryptoCurrenciesUseCase = GetCryptoCurrenciesConcrete()
    var mainViewModel : MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        launchNetworkCall()
        loadingIndicator()
        
    }
    func launchNetworkCall() {
        
        self.mainViewModel = MainViewModel(getCrypoCoins: self.getCryptoCurrenciesUseCase, completionHandler: {
            self.collectionView?.reloadData()
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return mainViewModel.cryptoModelCryptoCompare.count
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AllCryptoCollectionViewCell
        
        let theData = mainViewModel.cryptoModelCryptoCompare[indexPath.row]
        let urls = "https://www.cryptocompare.com\(theData.imageURL ?? "" )"
        cell.coinImage.downloadedFrom(link: urls)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/4.0
        let yourHeight = yourWidth
        
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toCryptoDetail"){
            
            if let indexPath = self.collectionView?.indexPath(for: sender as! AllCryptoCollectionViewCell)?.row {
                let cryptoDetailController = segue.destination as! CryptoDetailViewController
                
                cryptoDetailController.cryptoName = self.mainViewModel.cryptoModelCryptoCompare[indexPath].coinName
                cryptoDetailController.coinImageUrl = self.mainViewModel.cryptoModelCryptoCompare[indexPath].imageURL
                cryptoDetailController.cryptoSymbol = self.mainViewModel.cryptoModelCryptoCompare[indexPath].symbol
                cryptoDetailController.cryptoPoT = self.mainViewModel.cryptoModelCryptoCompare[indexPath].proofType
                cryptoDetailController.cryptoAlgo = self.mainViewModel.cryptoModelCryptoCompare[indexPath].algorithm
                
            }
        }
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
