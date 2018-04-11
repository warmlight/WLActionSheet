//
//  Transition.swift
//  ActionSheet
//
//  Created by lyy on 2018/4/10.
//  Copyright © 2018年 lyy. All rights reserved.
//

import UIKit

class Transition: NSObject, UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let present = PresentationController(presentedViewController: presented, presenting: presenting)
        return present
    }
}
