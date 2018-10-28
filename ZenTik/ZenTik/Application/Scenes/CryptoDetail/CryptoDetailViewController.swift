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
            contentUIView.layer.shadowColor = UIColor(red: 237/255, green: 23/255, blue: 141/255, alpha: 1).cgColor
            contentUIView.layer.shadowOffset = CGSize(width: 0, height: 1)
            contentUIView.layer.shadowOpacity = 1
            contentUIView.layer.shadowRadius = 1.0
            contentUIView.layer.cornerRadius = 10.0
        }
    }
        
    @IBOutlet weak var newsBtnUIView1: UIView!{
        didSet{
            newsBtnUIView1.addInnerShadow(topColor: UIColor(red: 237/255, green: 23/255, blue: 141/255, alpha: 1))
        }
    }
    @IBOutlet weak var newsBTN1: UIButton!

    @IBOutlet weak var NewsBtnUIView2: UIView!{
        didSet{
            NewsBtnUIView2.addInnerShadow(topColor: UIColor(red: 237/255, green: 23/255, blue: 141/255, alpha: 1))
        }
    }
    
    @IBOutlet weak var newsBtnUIView3: UIView!{
        didSet{
            newsBtnUIView3.addInnerShadow(topColor: UIColor(red: 237/255, green: 23/255, blue: 141/255, alpha: 1))
        }
    }
    
    @IBOutlet weak var basicContentUIViw: UIView!{
        didSet{
            basicContentUIViw.layer.shadowColor = UIColor(red: 237/255, green: 23/255, blue: 141/255, alpha: 1).cgColor
            basicContentUIViw.layer.shadowOffset = CGSize(width: 0, height: 1)
            basicContentUIViw.layer.shadowOpacity = 1
            basicContentUIViw.layer.shadowRadius = 1.0
            basicContentUIViw.layer.cornerRadius = 10.0
        }
    }
    
    @IBOutlet weak var imageUIView: UIView!{
        didSet{
            imageUIView.layer.shadowColor = UIColor(red: 237/255, green: 23/255, blue: 141/255, alpha: 1).cgColor
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
            coinUIImage.layer.shadowColor = UIColor(red: 237/255, green: 23/255, blue: 141/255, alpha: 1).cgColor
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
    let getPriceMultiUseCase = GetPriceMultiConcrete<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coinNameLBL.text = cryptoName
        coinSymbol.text = cryptoSymbol
        coinAlgo.text = cryptoAlgo
        coinPoT.text = cryptoPoT
        let imageUrl =  "https://www.cryptocompare.com\(coinImageUrl ?? "" )"
        coinUIImage.downloadedFrom(link: imageUrl)
        
        self.viewModel = CryptoDetailViewModel(getPriceMultiUseCase: self.getPriceMultiUseCase, chosenExchange: "CCCAGG", chosenCurrency: "USD", cryptoCoin: cryptoSymbol, completionHandler: {
            
            if(self.viewModel.priceMultiModel.type.isEmpty){
                self.alertDialogNoDataReturned()
            }else{
                
                //TODO: Populate with details
                
            }
        })
    }
    
    
    
    @IBAction func CloseBtn(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertDialogNoDataReturned(){
        let alert = UIAlertController(title: "Heads Up!", message: "It seems this coin/token is not listed on the selected exchange.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { handle in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
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
