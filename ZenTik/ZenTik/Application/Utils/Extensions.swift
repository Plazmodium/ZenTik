//
//  Extensions.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/19.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation
import UIKit

//source: https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

//source https://stackoverflow.com/questions/27960556/loading-an-overlay-when-running-long-tasks-in-ios

extension UIViewController{
    
    func loadingIndicator(){
        
        let alert = UIAlertController(title: nil, message: "Loading...", preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50)) as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    //usage:
    //        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboards))
    //        view.addGestureRecognizer(tap)
    @objc func dismissKeyboards() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

//source: https://gist.github.com/r-plus/31f109e44fc81a572192
extension UIView{
    
    public func addInnerShadow(topColor: UIColor = UIColor.black.withAlphaComponent(0.3)) {
        let shadowLayer = CAGradientLayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.frame = bounds
        shadowLayer.frame.size.height = 3.0
        shadowLayer.colors = [
            topColor.cgColor,
            UIColor.white.withAlphaComponent(0).cgColor
        ]
        layer.addSublayer(shadowLayer)
    }
    
    public func addInnerShadowLeft(leftColor: UIColor = UIColor.black.withAlphaComponent(1.0)) {
        let shadowLayer = CAGradientLayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.frame = bounds
        shadowLayer.frame.size.width = 3.0
        shadowLayer.colors = [
            leftColor.cgColor,
            UIColor.white.withAlphaComponent(0).cgColor
        ]
        layer.addSublayer(shadowLayer)
    }
}
