//
//  EMSheetViewConfig.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal typealias TSheetCellConfig = EMSheetViewCellConfig

open class EMSheetViewCellConfig {
    open var title: String!
    open var foo: (() -> Void)?
    public init(title: String = "",
                foo: (() -> Void)? = nil) {
        self.title = title
        self.foo = foo
    }
}

internal typealias TSheetConfig = EMSheetViewConfig

open class EMSheetViewConfig: EMPopViewConfig {
    
    internal var text: String!
    internal var cells = Array<TSheetCellConfig>()
    internal var cancelFoo: (() -> Void)?
    
    public init(colorStyle: EMPopViewColorStyle = EMPopViewDefaultValue.colorStyle,
                showAniStyle: EMPopViewShowAnimationStyle = EMPopViewDefaultValue.showAniStyle,
                closeAniStyle: EMPopViewCloseAnimationStyle = EMPopViewDefaultValue.closeAniStyle,
                windowAlpha: CGFloat = EMPopViewDefaultValue.windowAlpha,
                viewAlpha: CGFloat = EMPopViewDefaultValue.viewAlpha,
                text: String = "",
                cancelFoo: (() -> Void)? = nil) {
        super.init(colorStyle: colorStyle,
                   showAniStyle: showAniStyle,
                   closeAniStyle: closeAniStyle,
                   windowAlpha: windowAlpha,
                   viewAlpha: viewAlpha)
        self.text = text
        self.cancelFoo = cancelFoo
    }
    
    open func pushCell(withConfig cell: EMSheetViewCellConfig) {
        cells.append(cell)
    }
    
    open func popCell() -> EMSheetViewCellConfig? {
        return cells.popLast()
    }
}
