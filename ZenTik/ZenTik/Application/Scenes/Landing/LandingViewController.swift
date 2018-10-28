//
//  LandingViewController.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/09/18.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit
import AVFoundation
import FirebaseAuth

class LandingViewController: UIViewController {
    
    @IBOutlet weak var createAccountBTN: UIButton!{
        didSet{
            createAccountBTN.titleLabel?.font = UIFont(name: "bitwise", size: UIFont.buttonFontSize)
        }
    }
    
    @IBOutlet weak var signInBTN: UIButton!
    
    @IBOutlet weak var skipBTN: UIButton!
    
    //PROPERTIES
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    var handle: AuthStateDidChangeListenerHandle!
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.hidesBackButton = true
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
            if(auth.currentUser != nil){
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "viewController") as! ViewController
                self.navigationController?.pushViewController(newViewController, animated: true)
            }
        }
    }
    
    private func createVideo(){
        
        let theURL = Bundle.main.url(forResource:"Bellergy_videvo", withExtension: "mp4")
        
        avPlayer = AVPlayer(url: theURL!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = .none
        
        avPlayerLayer.frame = view.layer.bounds
        view.backgroundColor = .clear
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer.currentItem)
        
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero, completionHandler: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
        paused = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createVideo()
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
