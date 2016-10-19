//
//  EMAlertView.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal typealias TAlertView = EMAlertView

open class EMAlertView: EMPopView {
    
    lazy fileprivate var titleLabel = UILabel.init()
    lazy fileprivate var textLabel = UILabel.init()
    lazy fileprivate var btn1 = UIButton.init()
    lazy fileprivate var btn2 = UIButton.init()
    fileprivate var foo1: (() -> Void)?
    fileprivate var foo2: (() -> Void)?
    fileprivate var btnCount: Int!
    
    
    override func initSelf() {
        super.initSelf()
        titleLabel.font = TDefault.labelTitleFont
        titleLabel.textAlignment = .center
        backgroundView.addSubview(titleLabel)
        textLabel.font = TDefault.labelTextFont
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
        backgroundView.addSubview(textLabel)
        btn1.titleLabel?.font = TDefault.labelTextFont
        btn1.addTarget(self, action: #selector(TAlertView.btn1Click), for: UIControlEvents.touchUpInside)
        btn1.addTarget(self, action: #selector(TAlertView.btnDown(_:)), for: UIControlEvents.touchDown)
        btn1.addTarget(self, action: #selector(TAlertView.btnUp(_:)), for: UIControlEvents.touchUpInside)
        btn1.addTarget(self, action: #selector(TAlertView.btnUp(_:)), for: UIControlEvents.touchUpOutside)
        btn1.addTarget(self, action: #selector(TAlertView.btnUp(_:)), for: UIControlEvents.touchCancel)
        backgroundView.addSubview(btn1)
        btn2.titleLabel?.font = TDefault.labelTextFont
        btn2.addTarget(self, action: #selector(TAlertView.btn2Click), for: UIControlEvents.touchUpInside)
        btn2.addTarget(self, action: #selector(TAlertView.btnUp(_:)), for: UIControlEvents.touchDown)
        btn2.addTarget(self, action: #selector(TAlertView.btnUp(_:)), for: UIControlEvents.touchUpInside)
        btn2.addTarget(self, action: #selector(TAlertView.btnUp(_:)), for: UIControlEvents.touchUpOutside)
        btn2.addTarget(self, action: #selector(TAlertView.btnUp(_:)), for: UIControlEvents.touchCancel)
        backgroundView.addSubview(btn2)
        
    }
    
    override func resize() {
        super.resize()
        backgroundView.frame.size.width = min(self.frame.width, self.frame.height) * 7 / 8
        backgroundView.frame.size.height = max(self.frame.width, self.frame.height) * 1 / 3
        backgroundView.layer.cornerRadius = min(self.frame.width, self.frame.height) / 24
        backgroundView.center = self.center
        
        titleLabel.frame.size.width = backgroundView.frame.width
        titleLabel.frame.size.height = backgroundView.frame.height * (1 / 4 - 2 / 32)
        titleLabel.frame.origin.x = 0
        titleLabel.frame.origin.y = backgroundView.frame.height / 32
        
        textLabel.frame.size.width = backgroundView.frame.width
        textLabel.frame.size.height = backgroundView.frame.height * (1 / 2 - 1 / 64)
        textLabel.frame.origin.x = 0
        textLabel.frame.origin.y = backgroundView.frame.height / 4
        
        if (btnCount >= 2) {
            btn1.frame.size.width = backgroundView.frame.width / 2
            btn1.frame.size.height = backgroundView.frame.height / 4
            btn1.frame.origin.x = 0
            btn1.frame.origin.y = backgroundView.frame.height * 3 / 4
            
            btn2.frame.size.width = backgroundView.frame.width / 2
            btn2.frame.size.height = backgroundView.frame.height / 4
            btn2.frame.origin.x = backgroundView.frame.width / 2
            btn2.frame.origin.y = backgroundView.frame.height * 3 / 4
        } else {
            btn1.frame.size.width = backgroundView.frame.width
            btn1.frame.size.height = backgroundView.frame.height / 4
            btn1.frame.origin.x = 0
            btn1.frame.origin.y = backgroundView.frame.height * 3 / 4
        }
        
    }
    
    override internal func config(withIndex index: UInt, config: EMPopViewConfig) {
        super.config(withIndex: index, config: config)
        let config = config as! TAlertConfig
        titleLabel.text = config.title
        textLabel.text = config.text
        if config.btnList.count >= 1 {
            btnCount = 1
            let btnConfig = config.btnList[0]
            foo1 = btnConfig.foo
            configBtn(withBtn: btn1, config: btnConfig, colorStyle: config.colorStyle!)
        }
        if config.btnList.count >= 2 {
            btnCount = 2
            let btnConfig = config.btnList[1]
            foo2 = btnConfig.foo
            configBtn(withBtn: btn2, config: btnConfig, colorStyle: config.colorStyle!)
        }
        switch config.colorStyle! {
        case .white:
            backgroundView.backgroundColor = UIColor.white.withAlphaComponent(config.viewAlpha)
            titleLabel.textColor = UIColor.black
            textLabel.textColor = UIColor.black
            textLabel.backgroundColor = UIColor.white
            btn1.backgroundColor = UIColor.white
            btn2.backgroundColor = UIColor.white
        case .black:
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(config.viewAlpha)
            titleLabel.textColor = UIColor.white
            textLabel.textColor = UIColor.white
            textLabel.backgroundColor = UIColor.black
            btn1.backgroundColor = UIColor.black
            btn2.backgroundColor = UIColor.black
        }
    }
    
    fileprivate func configBtn(withBtn btn: UIButton, config: TAlertBtnConfig, colorStyle: TColorStyle) {
        btn.setTitle(config.text, for: UIControlState.normal)
        switch config.style! {
        case .default:
            switch colorStyle {
            case .white:
                btn.setTitleColor(UIColor.black, for: UIControlState.normal)
            case .black:
                btn.setTitleColor(UIColor.white, for: UIControlState.normal)
            }
        case .cancel:
            switch colorStyle {
            case .white:
                btn.setTitleColor(UIColor.red, for: UIControlState.normal)
            case .black:
                btn.setTitleColor(UIColor.red, for: UIControlState.normal)
            }
        }
    }
    
    internal func btn1Click() {
        foo1?()
        close()
    }
    
    internal func btn2Click() {
        foo2?()
        close()
    }
    
    internal func btnDown(_ sender: UIButton) {
        sender.alpha = 0.4
    }
    
    internal func btnUp(_ sender: UIButton) {
        sender.alpha = 1.0
    }
    
}
