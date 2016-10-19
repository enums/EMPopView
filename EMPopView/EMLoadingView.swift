//
//  EMLoadingView.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal typealias TLoadingView = EMLoadingView

open class EMLoadingView: EMPopView {
    
    lazy internal var activityView = UIActivityIndicatorView.init()
    
    override func initSelf() {
        super.initSelf()
        activityView.startAnimating()
        activityView.hidesWhenStopped = true
        backgroundView.addSubview(activityView)
    }
    
    override func resize() {
        super.resize()
        backgroundView.frame.size.width = min(self.frame.width, self.frame.height) / 4
        backgroundView.frame.size.height = backgroundView.frame.size.width
        backgroundView.layer.cornerRadius = backgroundView.frame.size.width / 6
        backgroundView.center.x = self.frame.width / 2
        backgroundView.center.y = self.frame.height / 2
        
        activityView.center.x = backgroundView.frame.width / 2
        activityView.center.y = backgroundView.frame.height / 2
    }
    
    override internal func config(withIndex index: UInt, config: EMPopViewConfig) {
        super.config(withIndex: index, config: config)
        let config = config as! TLoadingConfig
        switch config.colorStyle! {
        case .white:
            backgroundView.backgroundColor = UIColor.white.withAlphaComponent(config.viewAlpha)
            activityView.activityIndicatorViewStyle = .gray
        case .black:
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(config.viewAlpha)
            activityView.activityIndicatorViewStyle = .white
        }
    }
    
}
