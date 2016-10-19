//
//  EMPopViewConfig.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal typealias TColorStyle = EMPopViewColorStyle

public enum EMPopViewColorStyle {
    case white
    case black
}

internal typealias TConfig = EMPopViewConfig

open class EMPopViewConfig {
    
    open var colorStyle: EMPopViewColorStyle!
    open var showAniStyle: EMPopViewShowAnimationStyle!
    open var closeAniStyle: EMPopViewCloseAnimationStyle!
    open var windowAlpha: CGFloat!
    open var viewAlpha: CGFloat!
    
    public init(colorStyle: EMPopViewColorStyle = EMPopViewDefaultValue.colorStyle,
                showAniStyle: EMPopViewShowAnimationStyle = EMPopViewDefaultValue.showAniStyle,
                closeAniStyle: EMPopViewCloseAnimationStyle = EMPopViewDefaultValue.closeAniStyle,
                windowAlpha: CGFloat = EMPopViewDefaultValue.windowAlpha,
                viewAlpha: CGFloat = EMPopViewDefaultValue.viewAlpha) {
        self.colorStyle = colorStyle
        self.showAniStyle = showAniStyle
        self.closeAniStyle = closeAniStyle
        self.windowAlpha = windowAlpha
        self.viewAlpha = viewAlpha
    }
}
