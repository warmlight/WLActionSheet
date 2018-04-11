//
//  WLActionSheetCancelButton.swift
//  ActionSheet
//
//  Created by lyy on 2018/4/3.
//  Copyright © 2018年 lyy. All rights reserved.
//

import UIKit

class WLActionSheetCancelButton: UIButton {

    private var action: WLSheetAction?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.titleLabel?.font = ActionSheetVisualStyle.sheetItemFont
        self.setTitleColor(ActionSheetVisualStyle.sheetItemColor, for: .normal)
        self.setBackgroundImage(UIImage.image(with: ActionSheetVisualStyle.cancelViewSelectedBgColor), for: .highlighted)
    }
    
    func show(with action: WLSheetAction) {
        self.action = action
        self.setTitle(action.title, for: .normal)
    }
}
