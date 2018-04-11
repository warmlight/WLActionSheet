//
//  UIImage+Extension.swift
//  ActionSheet
//
//  Created by lyy on 2018/4/3.
//  Copyright © 2018年 lyy. All rights reserved.
//

import UIKit

extension UIImage {
    class func image(with color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()!
        color.setFill()
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
