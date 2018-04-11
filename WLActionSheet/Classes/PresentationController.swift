//
//  PresentationController.swift
//  UIPresentationController
//
//  Created by lyy on 2018/4/4.
//  Copyright © 2018年 lyy. All rights reserved.
//

import UIKit

/// use an instance to show the transition
class PresentationController: UIPresentationController {
    
    /// black layer
    lazy var blackView: UIView = {
        let view = UIView()
        if let frame = self.containerView?.bounds {
            view.frame = frame
        }
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(dismissActionSheet))
        view.addGestureRecognizer(gesture)
        return view
    }()
    
    @objc func dismissActionSheet() {
        self.presentingViewController.dismiss(animated: true, completion: nil)
    }
    
    /// value to control height of bottom view
    public var controllerHeight: CGFloat
    
    public override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        //get height from an objec of PresentBottomVC class
        if case let vc as WLActionSheetController = presentedViewController {
            controllerHeight = vc.controllerHeight ?? UIScreen.main.bounds.height
        } else {
            controllerHeight = UIScreen.main.bounds.width
        }
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    /// add blackView to the container and let alpha animate to 1 when show transition will begin
    public override func presentationTransitionWillBegin() {
        blackView.alpha = 0
        containerView?.addSubview(blackView)
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 1
        }
    }
    
    /// let blackView's alpha animate to 0 when hide transition will begin.
    public override func dismissalTransitionWillBegin() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
        }
    }
    
    /// remove the blackView when hide transition end
    ///
    /// - Parameter completed: completed or no
    public override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            blackView.removeFromSuperview()
        }
    }
    
    /// define the frame of bottom view
    public override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect(x: 0, y: UIScreen.main.bounds.height - controllerHeight, width: UIScreen.main.bounds.width, height: controllerHeight)
    }
}
