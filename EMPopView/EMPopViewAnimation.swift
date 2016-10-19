//
//  EMPopViewAnimation.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal typealias TViewAnimation = ((UIView) -> Void)

internal typealias TShowAniStyle = EMPopViewShowAnimationStyle
internal typealias TCloseAniStyle = EMPopViewCloseAnimationStyle

public enum EMPopViewShowAnimationStyle {
    case fadeIn
    case slideInBottom
}

public enum EMPopViewCloseAnimationStyle {
    case fadeOut
    case slideOutBottom
}
