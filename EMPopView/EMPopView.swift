//
//  EMPopView.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal typealias TView = EMPopView

open class EMPopView: UIView {
    fileprivate var index: UInt!
    fileprivate var showAnimation: TViewAnimation!
    fileprivate var showAniDuration: Double!
    fileprivate var closeAnimation: TViewAnimation!
    fileprivate var closeAniDuration: Double!
    
    lazy internal var backgroundView = UIView.init()
    
    required override public init(frame: CGRect) {
        super.init(frame: frame)
        initSelf()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSelf()
    }
    
    internal func initSelf() {
        self.alpha = 0
        backgroundView.layer.masksToBounds = true
        self.addSubview(backgroundView)
    }
    
    internal func resize() {
        self.frame = TDefault.viewFrame
    }
    
    internal func config(withIndex index: UInt, config: EMPopViewConfig) {
        self.index = index
        let (showAnimation, showAniDuration) = TAniFactory.getShowAnimation(withStyle: config.showAniStyle)
        let (closeAnimation, closeAniDuration) = TAniFactory.getCloseAnimation(withStyle: config.closeAniStyle)
        self.showAnimation = showAnimation
        self.showAniDuration = showAniDuration
        self.closeAnimation = closeAnimation
        self.closeAniDuration = closeAniDuration
        self.backgroundColor = UIColor.black.withAlphaComponent(config.windowAlpha)
    }
    
    open func show() {
        resize()
        UIApplication.shared.keyWindow!.addSubview(self)
        TAniFactory.getShowAnimation(withStyle: .fadeIn).animation(self)
        GCD.runInMain {
            self.showAnimation(self.backgroundView)
        }
    }
    
    
    open func close() {
        TAniFactory.getCloseAnimation(withStyle: .fadeOut).animation(self)
        closeAnimation(backgroundView)
        GCD.runInMainDelay(withDelay: closeAniDuration, foo: {
            self.removeFromSuperview()
            TViewFactory.releaseView(withIndex: self.index)
        })
    }
}
