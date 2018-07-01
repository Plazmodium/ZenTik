//
//  CryptoDetailViewController.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/29.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit

class CryptoDetailViewController: UIViewController {

    //MARK: IBOUTLETS & PROPERTIES
    
    @IBOutlet weak var contentUIView: UIView!{
        didSet{
            contentUIView.layer.shadowColor = UIColor.white.cgColor
            contentUIView.layer.shadowOffset = CGSize(width: 0, height: 1)
            contentUIView.layer.shadowOpacity = 1
            contentUIView.layer.shadowRadius = 1.0
            contentUIView.layer.cornerRadius = 10.0
        }
    }
        
    @IBOutlet weak var newsBtnUIView1: UIView!{
        didSet{
            newsBtnUIView1.addInnerShadow(topColor: UIColor.lightGray)
//            newsBtnUIView1.layer.shadowRadius = 10.0
//            newsBtnUIView1.layer.cornerRadius = 5.0
        }
    }
    
    @IBOutlet weak var newsBTN1: UIButton!{
        didSet{
//            newsBTN1.layer.borderColor = UIColor.black.cgColor
//            newsBTN1.layer.borderWidth = 0.01
        }
    }
    
    
    @IBOutlet weak var basicContentUIViw: UIView!{
        didSet{
            basicContentUIViw.layer.shadowColor = UIColor.white.cgColor
            basicContentUIViw.layer.shadowOffset = CGSize(width: 0, height: 1)
            basicContentUIViw.layer.shadowOpacity = 1
            basicContentUIViw.layer.shadowRadius = 1.0
            basicContentUIViw.layer.cornerRadius = 10.0
        }
    }
    
    @IBOutlet weak var imageUIView: UIView!{
        didSet{
            imageUIView.layer.shadowColor = UIColor.white.cgColor
            imageUIView.layer.shadowOffset = CGSize(width: 0, height: 1)
            imageUIView.layer.shadowOpacity = 1
            imageUIView.layer.shadowRadius = 1.0
            imageUIView.layer.cornerRadius = 10.0
        }
    }

    @IBOutlet weak var coinNameLBL: UILabel!
    @IBOutlet weak var coinPoT: UILabel!
    @IBOutlet weak var coinSymbol: UILabel!
    @IBOutlet weak var coinAlgo: UILabel!
    
    @IBOutlet weak var coinUIImage: UIImageView!{
        didSet{
            coinUIImage.clipsToBounds = true
            coinUIImage.layer.cornerRadius = 10.0
        }
    }
    
    var cryptoName :String!
    var cryptoSymbol :String!
    var cryptoAlgo :String!
    var cryptoPoT :String!
    var coinImageUrl :String!
    
    var viewModel:CryptoDetailViewModel!
    let getPriceMultiUseCase = GetPriceMultiConcrete()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coinNameLBL.text = cryptoName
        coinSymbol.text = cryptoSymbol
        coinAlgo.text = cryptoAlgo
        coinPoT.text = cryptoPoT
        let imageUrl =  "https://www.cryptocompare.com\(coinImageUrl ?? "" )"
        coinUIImage.downloadedFrom(link: imageUrl)
        
        self.viewModel = CryptoDetailViewModel(getPriceMultiUseCase: self.getPriceMultiUseCase, chosenExchange: "Coinbase", chosenCurrency: "USD", completionHandler: {
            
            print(self.viewModel.priceMultiModel.change24Hour)
        })
    }
    
    @IBAction func CloseBtn(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
