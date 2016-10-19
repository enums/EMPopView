//
//  ViewController.swift
//  EMPopViewExample
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import UIKit
import EMPopView

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loading() {
        let config = EMLoadingViewConfig.init(colorStyle: .white,
                                              showAniStyle: .fadeIn,
                                              closeAniStyle: .fadeOut)
        let index = EMPopViewFactory.showView(withType: .loading, config: config)
        GCD.runInMainDelay(delay: 2, foo: {
            EMPopViewFactory.closeView(withIndex: index)
        })
        
    }
    
    @IBAction func progress() {
        let config = EMProgressViewConfig.init(colorStyle: .white,
                                               showAniStyle: .fadeIn,
                                               closeAniStyle: .fadeOut,
                                               max: 5)
        let index = EMPopViewFactory.showView(withType: .progress, config: config)
        GCD.runInMainDelay(delay: 0.5, foo: {
            (EMPopViewFactory.getView(withIndex: index)! as! EMProgressView).step()
        })
        GCD.runInMainDelay(delay: 0.7, foo: {
            (EMPopViewFactory.getView(withIndex: index)! as! EMProgressView).step()
        })
        GCD.runInMainDelay(delay: 1.0, foo: {
            (EMPopViewFactory.getView(withIndex: index)! as! EMProgressView).step()
        })
        GCD.runInMainDelay(delay: 1.1, foo: {
            (EMPopViewFactory.getView(withIndex: index)! as! EMProgressView).step()
        })
        GCD.runInMainDelay(delay: 1.5, foo: {
            (EMPopViewFactory.getView(withIndex: index)! as! EMProgressView).step()
        })
        GCD.runInMainDelay(delay: 2, foo: {
            EMPopViewFactory.closeView(withIndex: index)
        })
    }
    
    @IBAction func sheet() {
        let config = EMSheetViewConfig.init(colorStyle: .white,
                                            showAniStyle: .slideInBottom,
                                            closeAniStyle: .slideOutBottom,
                                            text: "Sheet 选项")
        config.pushCell(withConfig: EMSheetViewCellConfig.init(title: "A",
                                                          foo: { print("A") }))
        config.pushCell(withConfig: EMSheetViewCellConfig.init(title: "B",
                                                          foo: { print("B") }))
        EMPopViewFactory.showView(withType: .sheet, config: config)
    }
    
    @IBAction func alert() {
        let config = EMAlertViewConfig.init(colorStyle: .white,
                                            showAniStyle: .fadeIn,
                                            closeAniStyle: .fadeOut,
                                            title: "删除",
                                            text: "确认要删除该项目吗？\n该操作无法撤销！")
        config.pushButton(withConfig: EMAlertViewButtonConfig.init(style: .default,
                                                                text: "取消",
                                                                foo: { print("back") }))
        config.pushButton(withConfig: EMAlertViewButtonConfig.init(style: .cancel,
                                                                text: "删除",
                                                                foo: { print("del") }))
        EMPopViewFactory.showView(withType: .alert, config: config)
        
    }
    
}

