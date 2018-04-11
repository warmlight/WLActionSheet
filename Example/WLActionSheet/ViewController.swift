//
//  ViewController.swift
//  WLActionSheet
//
//  Created by 462451377@qq.com on 04/11/2018.
//  Copyright (c) 2018 462451377@qq.com. All rights reserved.
//

import UIKit
import WLActionSheet

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(showSelf))
        self.view.addGestureRecognizer(gesture)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func showSelf() {
        
        let sheetCon = WLActionSheetController.init(title: "bbb", message: "ccc")
        let action = WLSheetAction.init(title: "1", style: .destructive)
        let action1 = WLSheetAction.init(title: "2", style: .default)
        let action2 = WLSheetAction.init(title: "cancel", style: .cancel)
        let action3 = WLSheetAction.init(title: "111", style: .default) { (action) in
            print("我是block")
        }
        
        sheetCon.addAction(action)
        sheetCon.addAction(action1)
        sheetCon.addAction(action2)
        
        sheetCon.addAction(action3)
        
        self.present(sheetCon, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

