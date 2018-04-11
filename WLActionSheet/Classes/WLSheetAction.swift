//
//  WLSheetAction.swift
//  ActionSheet
//
//  Created by lyy on 2018/4/2.
//  Copyright © 2018年 lyy. All rights reserved.
//

import UIKit

public enum SheetActionStyle : Int {
    case `default`
    
    case cancel
    
    case destructive
}

public class WLSheetAction: NSObject {
    open var title: String?
    
    open var style: SheetActionStyle
    
    open var handel: ((WLSheetAction) -> Swift.Void)?
    
    public init(title: String?, style: SheetActionStyle, handel: ((WLSheetAction) -> Swift.Void)? = nil) {
        self.title = title
        self.style = style
        self.handel = handel
        super.init()
    }
}
