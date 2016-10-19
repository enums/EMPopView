//
//  EMPopViewAnimationFactory.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal typealias TAniFactory = EMPopViewAnimationFactory

open class EMPopViewAnimationFactory {
    
    static internal func getShowAnimation(withStyle style: TShowAniStyle) -> (animation: TViewAnimation, duration: Double) {
        var duration: Double = 0
        switch style {
        case .fadeIn:
            duration = 0.2
            return ({view in
                UIView.animate(withDuration: duration, animations: {
                    view.alpha = 1
                })
                }, duration)
        case .slideInBottom:
            duration = 0.2
            return ({view in
                let y = view.frame.origin.y
                view.frame.origin.y = TDefault.viewHeight
                UIView.animate(withDuration: duration, animations: {
                    view.frame.origin.y = y
                })
                }, duration)
        }
    }
    
    static internal func getCloseAnimation(withStyle style: TCloseAniStyle) -> (animation: TViewAnimation, duration: Double) {
        var duration: Double = 0
        switch style {
        case .fadeOut:
            duration = 0.2
            return ({view in
                UIView.animate(withDuration: duration, animations: {
                    view.alpha = 0
                })
                }, duration)
        case .slideOutBottom:
            duration = 0.2
            return ({view in
                UIView.animate(withDuration: duration, animations: {
                    view.frame.origin.y = TDefault.viewHeight
                })
                }, duration)
        }
    }
}
