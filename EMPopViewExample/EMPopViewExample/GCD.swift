//
//  GCD.swift
//  EMPopViewExample
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal class GCD {
    static public func runGlobal(foo: @escaping ((Void) -> Void), inMainFoo: @escaping ((Void) -> Void)) {
        DispatchQueue.global().async(execute: {
            foo()
            runInMain(foo: inMainFoo)
        })
    }
    
    static public func runInMain(foo: @escaping ((Void) -> Void)) {
        runInMainDelay(delay: 0, foo: foo)
    }
    
    static public func runInMainDelay(delay: Double, foo: @escaping ((Void) -> Void)) {
        let deadline = DispatchTime.now() + .milliseconds(Int(delay * 1000))
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            foo()
        })
    }
}
