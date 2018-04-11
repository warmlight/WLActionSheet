//
//  WLActionSheetController.swift
//  ActionSheet
//
//  Created by lyy on 2018/4/2.
//  Copyright © 2018年 lyy. All rights reserved.
//

import UIKit
import SnapKit

public class WLActionSheetController: UIViewController {
    private let tableView = UITableView()
    private var titleView: WLActionSheetTitleView
    private let cancelView = WLActionSheetCancelButton()
    private lazy var transitionDelegate = Transition()
    
    private var actions = [WLSheetAction]()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ActionSheetVisualStyle.sheetItemSeparatorColor
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(title: String?, message: String?) {
        titleView = WLActionSheetTitleView.init(title: title, message: message)
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = transitionDelegate

        setup()
    }
    
    public func addAction(_ action: WLSheetAction) {
        if action.style == .cancel {
            updateCancelViewLayout()
            cancelView.show(with: action)
        } else {
            actions.append(action)
            updateTableViewLayout()
        }
    }
    
    @objc func clickCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    var controllerHeight: CGFloat? {
        self.view.layoutIfNeeded()
        
        if cancelView.frame.origin.y + cancelView.frame.height > self.view.frame.height {
            tableView.snp.updateConstraints { (make) in
                make.height.equalTo(self.view.frame.height - cancelView.frame.height - titleView.frame.height)
            }
            self.view.layoutIfNeeded()
            return self.view.frame.height
        }
        
        return cancelView.frame.origin.y + cancelView.frame.height
    }
}

// MARK: Setup UI
extension WLActionSheetController {
    
    fileprivate func setup() {
        setupTableView()
        setupCancelView()
        setupTitleView()
        
        bindingSubviewsLayout()
    }
    
    private func setupTableView() {
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = ActionSheetVisualStyle.sheetItemHeight
        tableView.register(WLActionSheetCell.self, forCellReuseIdentifier: "WLActionSheetCell")
        
        view.addSubview(tableView)
    }
    
    private func setupCancelView() {
        cancelView.addTarget(self, action: #selector(clickCancel), for: .touchUpInside)

        view.addSubview(cancelView)
    }
    
    private func setupTitleView() {
        view.addSubview(titleView)
    }
    
    fileprivate func bindingSubviewsLayout() {
        titleView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view)
        }

        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.titleView.snp.bottom).offset(1)
            make.height.equalTo(CGFloat(actions.count) * ActionSheetVisualStyle.sheetItemHeight)
        }

        cancelView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.tableView.snp.bottom).offset(0)
            make.height.equalTo(0)
        }
    }
    
    fileprivate func updateCancelViewLayout() {
        cancelView.snp.updateConstraints({ (make) in
            make.height.equalTo(ActionSheetVisualStyle.sheetItemHeight)
            make.top.equalTo(self.tableView.snp.bottom).offset(5)

        })
    }
    
    fileprivate func updateTableViewLayout() {
        tableView.snp.updateConstraints { (make) in
            make.height.equalTo(CGFloat(actions.count) * ActionSheetVisualStyle.sheetItemHeight)
        }
    }
}

// MARK: UITableViewDelegate
extension WLActionSheetController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let handel = actions[indexPath.row].handel {
            handel(actions[indexPath.row])
        }
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: UITableViewDataSource
extension WLActionSheetController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WLActionSheetCell") as! WLActionSheetCell
        cell.showCell(with: actions[indexPath.row])
        return cell
    }
}
