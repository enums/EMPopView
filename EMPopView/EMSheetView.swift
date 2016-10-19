//
//  EMSheetView.swift
//  EMPopView
//
//  Created by 郑宇琦 on 2016/10/19.
//  Copyright © 2016年 郑宇琦. All rights reserved.
//

import Foundation
import UIKit

internal typealias TSheetView = EMSheetView

open class EMSheetView: EMPopView, UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    static fileprivate var tableViewCellIdentifier = "cell"
    static fileprivate var tableViewCellHeight: CGFloat {
        get {
            switch UIDevice.current.userInterfaceIdiom {
            case .phone:
                return 44
            case .pad:
                return 88
            default:
                return 44
            }
        }
    }
    lazy fileprivate var dataSource = Array<TSheetCellConfig>()
    
    internal var tapGesture: UITapGestureRecognizer!
    lazy internal var label = UILabel.init()
    lazy internal var tableView = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.plain)
    lazy internal var cancelBtn = UIButton.init()
    internal var cancelFoo: (()->Void)?
    
    fileprivate var colorStyle: TColorStyle!
    
    override func initSelf() {
        super.initSelf()
        tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(TSheetView.cancel))
        tapGesture.delegate = self
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
        label.font = TDefault.labelTitleFont
        label.textAlignment = .center
        label.numberOfLines = 0
        backgroundView.addSubview(label)
        cancelBtn.titleLabel?.font = TDefault.labelTextFont
        cancelBtn.setTitle("取消", for: UIControlState.normal)
        cancelBtn.addTarget(self, action: #selector(TSheetView.cancel), for: UIControlEvents.touchUpInside)
        cancelBtn.addTarget(self, action: #selector(TSheetView.btnDown(_:)), for: UIControlEvents.touchDown)
        cancelBtn.addTarget(self, action: #selector(TSheetView.btnUp(_:)), for: UIControlEvents.touchUpInside)
        cancelBtn.addTarget(self, action: #selector(TSheetView.btnUp(_:)), for: UIControlEvents.touchUpOutside)
        cancelBtn.addTarget(self, action: #selector(TSheetView.btnUp(_:)), for: UIControlEvents.touchCancel)
        backgroundView.addSubview(cancelBtn)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TSheetView.tableViewCellIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        backgroundView.addSubview(tableView)
    }
    
    override func resize() {
        super.resize()
        let h1 = self.frame.height * 1 / 2 * (10 / 32)
        let h2 = TSheetView.tableViewCellHeight
        let h3 = TSheetView.tableViewCellHeight * CGFloat(dataSource.count)
        let isNeedScroll = h1 + h2 + h3 > self.frame.height * 1 / 2
        backgroundView.frame.size.width =  self.frame.width * 15 / 16
        if isNeedScroll {
            backgroundView.frame.size.height = self.frame.height * 1 / 2
        } else {
            backgroundView.frame.size.height = h1 + h2 + h3
        }
        backgroundView.layer.cornerRadius = min(self.frame.width, self.frame.height) / 24
        backgroundView.center.x = self.center.x
        backgroundView.frame.origin.y = self.frame.height - backgroundView.frame.height - min(self.frame.width, self.frame.height) / 32
        
        label.frame.size.width =  backgroundView.frame.size.width * 15 / 16
        label.frame.size.height = self.frame.height * 1 / 2 * (1 / 4 - 2 / 32)
        label.frame.origin.x = backgroundView.frame.size.width * 1 / 32
        label.frame.origin.y = self.frame.height * 1 / 2 * 1 / 32
        
        cancelBtn.frame.size.width =  backgroundView.frame.size.width * 15 / 16
        cancelBtn.frame.size.height = TSheetView.tableViewCellHeight
        cancelBtn.frame.origin.x = backgroundView.frame.size.width * 1 / 32
        cancelBtn.frame.origin.y = backgroundView.frame.size.height - self.frame.height * 1 / 2 * 1 / 32 - cancelBtn.frame.size.height
        cancelBtn.layer.cornerRadius = min(self.frame.width, self.frame.height) / 24
        
        tableView.frame.size.width =  backgroundView.frame.size.width * 15 / 16
        tableView.frame.origin.x = backgroundView.frame.size.width * 1 / 32
        tableView.frame.origin.y = label.frame.maxY + self.frame.height * 1 / 2 * 1 / 32
        tableView.layer.cornerRadius = min(self.frame.width, self.frame.height) / 24
        if isNeedScroll {
            tableView.frame.size.height = cancelBtn.frame.origin.y - tableView.frame.origin.y - backgroundView.frame.size.height / 32
            tableView.isScrollEnabled = true
        } else {
            tableView.frame.size.height = h3
            tableView.isScrollEnabled = false
        }
        
        
    }
    
    override internal func config(withIndex index: UInt, config: EMPopViewConfig) {
        super.config(withIndex: index, config: config)
        let config = config as! TSheetConfig
        colorStyle = config.colorStyle
        dataSource = config.cells
        cancelFoo = config.cancelFoo
        switch config.colorStyle! {
        case .white:
            backgroundView.backgroundColor = UIColor.white.withAlphaComponent(config.viewAlpha)
            label.textColor = UIColor.black
            cancelBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
            cancelBtn.backgroundColor = UIColor.white
            tableView.backgroundColor = UIColor.white
        case .black:
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(config.viewAlpha)
            label.textColor = UIColor.white
            cancelBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
            cancelBtn.backgroundColor = UIColor.black
            tableView.backgroundColor = UIColor.black
        }
        label.text = config.text
    }
    
    override open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let pos = gestureRecognizer.location(in: self)
        if backgroundView.frame.contains(pos) {
            return false
        } else {
            return true
        }
    }
    
    open func cancel() {
        cancelFoo?()
        close()
    }
    
    internal func btnDown(_ sender: UIButton) {
        sender.alpha = 0.4
    }
    
    internal func btnUp(_ sender: UIButton) {
        sender.alpha = 1.0
    }
    
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TSheetView.tableViewCellHeight
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: TSheetView.tableViewCellIdentifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: TSheetView.tableViewCellIdentifier)
        }
        let row = indexPath.row
        let rowData = dataSource[row]
        cell!.textLabel!.font = TDefault.labelTextFont
        cell!.textLabel!.text = rowData.title
        cell!.textLabel!.textAlignment = .center
        switch colorStyle! {
        case .white:
            cell!.backgroundColor = UIColor.white
            cell!.textLabel!.textColor = UIColor.black
        case .black:
            cell!.backgroundColor = UIColor.black
            cell!.textLabel!.textColor = UIColor.white
        }
        return cell!
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let rowData = dataSource[row]
        let foo = rowData.foo
        foo?()
        close()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
