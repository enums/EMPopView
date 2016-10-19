//
//  EMProgressViewConfig.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal typealias TProgressConfig = EMProgressViewConfig

open class EMProgressViewConfig: EMPopViewConfig {
    open var max: UInt!
    open var step: UInt!
    
    public init(colorStyle: EMPopViewColorStyle = EMPopViewDefaultValue.colorStyle,
                showAniStyle: EMPopViewShowAnimationStyle = EMPopViewDefaultValue.showAniStyle,
                closeAniStyle: EMPopViewCloseAnimationStyle = EMPopViewDefaultValue.closeAniStyle,
                windowAlpha: CGFloat = EMPopViewDefaultValue.windowAlpha,
                viewAlpha: CGFloat = EMPopViewDefaultValue.viewAlpha,
                max: UInt = 100,
                step: UInt = 1) {
        super.init(colorStyle: colorStyle,
                   showAniStyle: showAniStyle,
                   closeAniStyle: closeAniStyle,
                   windowAlpha: windowAlpha,
                   viewAlpha: viewAlpha)
        self.max = max
        self.step = step
    }
}
