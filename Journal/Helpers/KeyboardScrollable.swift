//
//  KeyboardScrollable.swift
//  Journal
//
//  Created by Weili Yi  on 2018/9/10.
//  Copyright © 2018 Weili Yi. All rights reserved.
//

import UIKit

@objc protocol KeyboardScrollable {
    
    var scrollView: UIScrollView? { get }
    @objc func keyboardDidShow(_ notification: Notification)
    @objc func keyboardWillHide(_ notification: Notification)

}

extension KeyboardScrollable where Self: UIViewController {
    
    func registerForKeyboardNotifications () {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWasShown(_ notification: Notification) {
        guard
            let info = notification.userInfo,
            let kbValue = info[UIKeyboardFrameBeginUserInfoKey] as? NSValue,
            let scrollView = scrollView
        else { return }
        
        let kbSize = kbValue.cgRectValue.size
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    func keyboardWillBeHidden(_ notification: Notification) {
        let contentInserts = UIEdgeInsets.zero
        scrollView?.contentInset = contentInserts
        scrollView?.scrollIndicatorInsets = contentInserts
    }
}
