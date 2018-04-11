# WLActionSheet

[![CI Status](http://img.shields.io/travis/462451377@qq.com/WLActionSheet.svg?style=flat)](https://travis-ci.org/462451377@qq.com/WLActionSheet)
[![Version](https://img.shields.io/cocoapods/v/WLActionSheet.svg?style=flat)](http://cocoapods.org/pods/WLActionSheet)
[![License](https://img.shields.io/cocoapods/l/WLActionSheet.svg?style=flat)](http://cocoapods.org/pods/WLActionSheet)
[![Platform](https://img.shields.io/cocoapods/p/WLActionSheet.svg?style=flat)](http://cocoapods.org/pods/WLActionSheet)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

WLActionSheet is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WLActionSheet'
```

## Use
```Swift
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
```


## License

WLActionSheet is available under the MIT license. See the LICENSE file for more info.
=======
A action sheet like wechat
