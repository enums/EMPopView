//
//  GCD.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal class GCD {
    static open func runGlobal(withFoo foo: @escaping ((Void) -> Void), inMainFoo: @escaping ((Void) -> Void)) {
        DispatchQueue.global().async(execute: {
            foo()
            runInMain(withFoo: inMainFoo)
        })
    }
    
    static open func runInMain(withFoo foo: @escaping ((Void) -> Void)) {
        runInMainDelay(withDelay: 0, foo: foo)
    }
    
    static open func runInMainDelay(withDelay delay: Double, foo: @escaping ((Void) -> Void)) {
        let deadline = DispatchTime.now() + .milliseconds(Int(delay * 1000))
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            foo()
        })
    }
}
