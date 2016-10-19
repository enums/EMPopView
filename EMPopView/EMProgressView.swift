//
//  EMProgressView.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal typealias TProgressView = EMProgressView

open class EMProgressView: EMPopView {
    
    lazy internal var activityView = UIActivityIndicatorView.init()
    lazy internal var progressView = UIProgressView.init()
    fileprivate var progressMax: UInt = 0
    fileprivate var progressCurrent: UInt = 0 {
        didSet {
            GCD.runInMain {
                self.progressView.progress = self.progressPercent
            }
        }
    }
    fileprivate var progressStep: UInt = 0
    fileprivate var progressPercent: Float {
        get {
            if (progressMax != 0) {
                return Float(progressCurrent) / Float(progressMax)
            } else {
                return 0
            }
        }
    }
    
    override func initSelf() {
        super.initSelf()
        activityView.startAnimating()
        activityView.hidesWhenStopped = true
        backgroundView.addSubview(activityView)
        backgroundView.addSubview(progressView)
    }
    
    override func resize() {
        super.resize()
        backgroundView.frame.size.width = min(self.frame.width, self.frame.height) / 4
        backgroundView.frame.size.height = backgroundView.frame.size.width
        backgroundView.layer.cornerRadius = backgroundView.frame.size.width / 6
        backgroundView.center = self.center
        
        activityView.center.x = backgroundView.frame.width / 2
        activityView.center.y = backgroundView.frame.height / 2
        
        progressView.frame.size.width = backgroundView.frame.size.width * 5 / 8
        progressView.center.x = backgroundView.frame.width / 2
        progressView.center.y = backgroundView.frame.height * 4 / 5
        
    }
    
    override internal func config(withIndex index: UInt, config: EMPopViewConfig) {
        super.config(withIndex: index, config: config)
        let config = config as! TProgressConfig
        progressMax = config.max
        progressCurrent = 0
        progressStep = config.step
        switch config.colorStyle! {
        case .white:
            backgroundView.backgroundColor = UIColor.white.withAlphaComponent(config.viewAlpha)
            activityView.activityIndicatorViewStyle = .gray
            progressView.tintColor = UIColor.black
        case .black:
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(config.viewAlpha)
            activityView.activityIndicatorViewStyle = .white
            progressView.tintColor = UIColor.white
        }
    }
    
    open func step(withValue value: UInt? = nil) {
        var value = value
        if value == nil {
            value = progressStep
        }
        progressCurrent += value!
    }
    
    open func setProgress(withCurrent current: UInt) {
        progressCurrent = current
    }
    
}

