//
//  EMPopViewFactory.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation

internal typealias TViewType = EMPopViewType

public enum EMPopViewType {
    case loading
    case progress
    case sheet
    case alert
}

internal typealias TViewFactory = EMPopViewFactory

open class EMPopViewFactory {
    static open func regist() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIApplicationDidChangeStatusBarFrame, object: nil, queue: OperationQueue.main, using: { _ in
            for (_, view) in viewPool {
                view.resize()
            }
        })
    }
    
    
    static private var viewIndex: UInt = 0
    static fileprivate var viewPool = Dictionary<UInt, TView>()
    
    static fileprivate func viewFactory(_ type: TViewType) -> TView {
        switch type {
        case .loading:
            return TLoadingView.init(frame: TDefault.viewFrame)
        case .progress:
            return TProgressView.init(frame: TDefault.viewFrame)
        case .sheet:
            return TSheetView.init(frame: TDefault.viewFrame)
        case .alert:
            return TAlertView.init(frame: TDefault.viewFrame)
        }
    }
    
    @discardableResult
    static public func showView(withType type: EMPopViewType, config: EMPopViewConfig) -> UInt {
        viewIndex += 1
        let view = viewFactory(type)
        view.config(withIndex: viewIndex, config: config)
        view.show()
        viewPool[viewIndex] = view
        return viewIndex
    }
    
    @discardableResult
    static public func closeView(withIndex index: UInt) -> Bool {
        if let progressView = getView(withIndex: index) {
            progressView.close()
            return true
        } else {
            return false
        }
    }
    
    static public func getView(withIndex index: UInt) -> EMPopView? {
        return viewPool[index]
    }
    
    static internal func releaseView(withIndex index: UInt) {
        viewPool.removeValue(forKey: index)
    }
    
}
