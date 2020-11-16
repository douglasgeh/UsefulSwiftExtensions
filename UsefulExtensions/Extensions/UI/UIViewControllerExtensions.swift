//
//  UIExtensions.swift
//  UsefulExtensions
//
//  Created by Douglas Gehring on 16/11/20.
//  Copyright © 2020 Douglas Gehring. All rights reserved.
//

import UIKit

public extension UIViewController {
    func clearNavBarBackground(_ clear: Bool = true) {
        self.navigationController?.navigationBar.setBackgroundImage(clear ? UIImage() : nil, for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = clear ? UIImage() : nil
        self.navigationController?.navigationBar.isTranslucent = clear
    }
    
    func setActivityIndicator(enabled: Bool, showBackgroundLayer: Bool = false, enableUserInteraction: Bool = false) {
       
        guard enabled else {
            self.removeActivityIndicator()
            return
        }
        
        self.showActivityIndicator(showBackgroundLayer, enableUserInteraction)
        
    }
    
    fileprivate func showActivityIndicator(_ showBackgroundLayer: Bool = false, _ enableUserInteraction: Bool = false) {
    
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.center = self.view.center
        activityIndicator.tag = GlobalTags.activityIndicator.rawValue
        activityIndicator.color = AppColors.accent
        activityIndicator.startAnimating()
        activityIndicator.layer.zPosition = LayerLevels.upper.rawValue
        
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = enableUserInteraction
            self.setLoadingLayer(enabled: showBackgroundLayer)
            self.view.addSubview(activityIndicator)
        }
    }
    
    fileprivate func removeActivityIndicator() {
        DispatchQueue.main.async {
            self.view.removeSubView(withTag: GlobalTags.activityIndicator.rawValue)
            self.setLoadingLayer(enabled: false)
            self.view.isUserInteractionEnabled = true
        }
    }
    
    func setLoadingLayer(enabled: Bool) {
        guard enabled else {
            self.view.removeSubView(withTag: GlobalTags.loadingLayer.rawValue)
            return
        }
        
        let loadingLayerView = UIView(frame: self.view.frame)
        loadingLayerView.backgroundColor = AppColors.loadingLayer
        loadingLayerView.tag = GlobalTags.loadingLayer.rawValue
        loadingLayerView.layer.zPosition =  LayerLevels.lower.rawValue
        self.view.addSubview(loadingLayerView)
    }
}
