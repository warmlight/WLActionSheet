//
//  WLActionSheetTitleView.swift
//  ActionSheet
//
//  Created by lyy on 2018/4/2.
//  Copyright © 2018年 lyy. All rights reserved.
//

import UIKit

class WLActionSheetTitleView: UIView {
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    
    init(title: String?, message: String?) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        
        titleLabel.text = title
        messageLabel.text = message
    
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Setup UI

extension WLActionSheetTitleView {
    
    fileprivate func setup() {
        setupUI()
        bindingSubviewsLayout()
    }
    
    private func setupUI() {
        setupTitleLabel()
        setupMessageLabel()
    }
    
    private func setupTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = ActionSheetVisualStyle.titleFont
        titleLabel.textColor = ActionSheetVisualStyle.titleColor
        
        self.addSubview(titleLabel)
    }
    
    private func setupMessageLabel() {
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = ActionSheetVisualStyle.messageFont
        messageLabel.textColor = ActionSheetVisualStyle.messageColor
        
        self.addSubview(messageLabel)
    }
    
    private func bindingSubviewsLayout() {
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            if let title = titleLabel.text, title.count > 0 {
                make.top.equalTo(self).offset(5)
            } else {
                make.top.equalTo(self).offset(0)
            }
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-15)
            if let title = messageLabel.text, title.count > 0 {
                make.top.equalTo(titleLabel.snp.bottom).offset(2)
                make.bottom.equalTo(self.snp.bottom).offset(-5)
            } else {
                make.top.equalTo(titleLabel.snp.bottom).offset(0)
                make.bottom.equalTo(self.snp.bottom).offset(0)
            }
        }
    }
}
