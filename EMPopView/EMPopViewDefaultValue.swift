//
//  EMPopViewDefaultValue.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal typealias TDefault = EMPopViewDefaultValue

open class EMPopViewDefaultValue {
    static internal var viewSize: CGSize {
        get {
            return UIScreen.main.bounds.size
        }
    }
    static internal var viewFrame: CGRect {
        get {
            return CGRect.init(origin: CGPoint.zero, size: viewSize)
        }
    }
    static internal var viewHeight: CGFloat {
        get {
            return viewSize.height
        }
    }
    static internal var viewWidth: CGFloat {
        get {
            return viewSize.width
        }
    }
    static internal var phoneTitleFontSize: CGFloat = 18
    static internal var phoneTextFontSize: CGFloat = 16
    
    static internal var padTitleFontSize: CGFloat = 26
    static internal var padTextFontSize: CGFloat = 20
    
    static internal var labelTitleFont: UIFont {
        get {
            switch UIDevice.current.userInterfaceIdiom {
            case .phone:
                return UIFont.systemFont(ofSize: phoneTitleFontSize)
            case .pad:
                return UIFont.systemFont(ofSize: padTitleFontSize)
            default:
                return UIFont.systemFont(ofSize: 20)
            }
        }
    }
    
    static internal var labelTextFont: UIFont {
        get {
            switch UIDevice.current.userInterfaceIdiom {
            case .phone:
                return UIFont.systemFont(ofSize: phoneTextFontSize)
            case .pad:
                return UIFont.systemFont(ofSize: padTextFontSize)
            default:
                return UIFont.systemFont(ofSize: 16)
            }
        }
    }
    
    
    static internal var colorStyle: TColorStyle = .white
    static internal var showAniStyle: TShowAniStyle = .fadeIn
    static internal var closeAniStyle: TCloseAniStyle = .fadeOut
    static internal var windowAlpha: CGFloat = 0.2
    static internal var viewAlpha: CGFloat = 0.8
    
    static open func setDefault(  colorStyle: EMPopViewColorStyle! = nil,
                                  showAniStyle: EMPopViewShowAnimationStyle! = nil,
                                  closeAniStyle: EMPopViewCloseAnimationStyle! = nil,
                                  windowAlpha: CGFloat! = nil,
                                  viewAlpha: CGFloat! = nil,
                                  phoneTitleFontSize: CGFloat! = nil,
                                  phoneTextFontSize: CGFloat! = nil,
                                  padTitleFontSize: CGFloat! = nil,
                                  padTextFontSize: CGFloat! = nil) {
        if colorStyle != nil {
            TDefault.colorStyle = colorStyle
        }
        if showAniStyle != nil {
            TDefault.showAniStyle = showAniStyle
        }
        if closeAniStyle != nil {
            TDefault.closeAniStyle = closeAniStyle
        }
        if windowAlpha != nil {
            TDefault.windowAlpha = windowAlpha
        }
        if viewAlpha != nil {
            TDefault.viewAlpha = viewAlpha
        }
        if phoneTitleFontSize != nil {
            TDefault.phoneTitleFontSize = phoneTitleFontSize
        }
        if phoneTextFontSize != nil {
            TDefault.phoneTextFontSize = phoneTextFontSize
        }
        if padTitleFontSize != nil {
            TDefault.padTitleFontSize = padTitleFontSize
        }
        if padTextFontSize != nil {
            TDefault.padTextFontSize = padTextFontSize
        }
    }
}
