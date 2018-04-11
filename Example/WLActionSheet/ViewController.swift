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
        
        let sheetCon = WLActionSheetController(title: "Hello", message: "Have a good day")
        let action = WLSheetAction(title: "1", style: .default)
        let action1 = WLSheetAction(title: "2", style: .destructive) { (action) in
            print("click")
        }
        let action2 = WLSheetAction(title: "cancel", style: .cancel)
        
        sheetCon.addAction(action)
        sheetCon.addAction(action1)
        sheetCon.addAction(action2)
        
        self.present(sheetCon, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

