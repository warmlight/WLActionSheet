//
//  WLActionSheetCell.swift
//  ActionSheet
//
//  Created by lyy on 2018/4/2.
//  Copyright © 2018年 lyy. All rights reserved.
//

import UIKit

class WLActionSheetCell: UITableViewCell {
    
    private var handel: ((WLSheetAction) -> Swift.Void)?
    private var line = UIView()
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showCell(with action: WLSheetAction) {
        self.handel = action.handel
        textLabel?.text = action.title

        if action.style == .destructive {
            textLabel?.textColor = ActionSheetVisualStyle.sheetItemDestructiveColor
        } else {
            textLabel?.textColor = ActionSheetVisualStyle.sheetItemColor
        }
    }
}

// MARK: Setup UI
extension WLActionSheetCell {
    fileprivate func setup() {
        setupUI()
        bindingSubviewsLayout()
    }
    
    private func setupUI() {
        backgroundColor = .white
        textLabel?.textAlignment = .center
        textLabel?.font = ActionSheetVisualStyle.sheetItemFont
    
        setupLine()
    }
    
    private func setupLine() {
        line.backgroundColor = ActionSheetVisualStyle.sheetItemSeparatorColor
        
        self.addSubview(line)
    }
    
    private func bindingSubviewsLayout() {
        line.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(1)
        }
    }
}
