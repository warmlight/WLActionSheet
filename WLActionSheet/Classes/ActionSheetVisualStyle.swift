//
//  ActionSheetVisualStyle.swift
//  ActionSheet
//
//  Created by lyy on 2018/4/2.
//  Copyright © 2018年 lyy. All rights reserved.
//

import UIKit

public class ActionSheetVisualStyle: NSObject {
    static var sheetItemHeight: CGFloat = 50
    static var titleFont = UIFont.systemFont(ofSize: 12)
    static var messageFont = UIFont.systemFont(ofSize: 12)
    static var sheetItemFont = UIFont.systemFont(ofSize: 17)
    static var titleColor = UIColor.lightGray
    static var messageColor = UIColor.lightGray
    static var sheetItemColor = UIColor(red: 17/255, green: 17/255, blue: 17/255, alpha: 1)
    static var sheetItemDestructiveColor = UIColor.red
    static var sheetItemSeparatorColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
    static var cancelViewSelectedBgColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
}
