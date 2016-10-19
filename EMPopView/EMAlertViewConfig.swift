//
//  EMAlertViewConfig.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit


internal typealias TAlertBtnStyle = EMAlertViewButtonStyle

public enum EMAlertViewButtonStyle {
    case `default`
    case cancel
}

internal typealias TAlertBtnConfig = EMAlertViewButtonConfig

public struct EMAlertViewButtonConfig {
    internal var style: TAlertBtnStyle!
    internal var text: String!
    internal var foo: (() -> Void)?
    public init(style: EMAlertViewButtonStyle = .default,
                text: String = "",
                foo: (() -> Void)? = nil) {
        self.style = style
        self.text = text
        self.foo = foo
    }
}

internal typealias TAlertConfig = EMAlertViewConfig

open class EMAlertViewConfig: EMPopViewConfig {
    
    internal var title: String!
    internal var text: String!
    
    internal var btnList = Array<TAlertBtnConfig>()
    
    public init(colorStyle: EMPopViewColorStyle = EMPopViewDefaultValue.colorStyle,
                showAniStyle: EMPopViewShowAnimationStyle = EMPopViewDefaultValue.showAniStyle,
                closeAniStyle: EMPopViewCloseAnimationStyle = EMPopViewDefaultValue.closeAniStyle,
                windowAlpha: CGFloat = EMPopViewDefaultValue.windowAlpha,
                viewAlpha: CGFloat = EMPopViewDefaultValue.viewAlpha,
                title: String = "",
                text: String = "") {
        super.init(colorStyle: colorStyle,
                   showAniStyle: showAniStyle,
                   closeAniStyle: closeAniStyle,
                   windowAlpha: windowAlpha,
                   viewAlpha: viewAlpha)
        self.title = title
        self.text = text
    }
    
    open func pushButton(withConfig config: EMAlertViewButtonConfig) {
        if (btnList.count < 2) {
            btnList.append(config)
        }
    }
    
    open func popButton() -> EMAlertViewButtonConfig? {
        return btnList.popLast()
    }
    
}
