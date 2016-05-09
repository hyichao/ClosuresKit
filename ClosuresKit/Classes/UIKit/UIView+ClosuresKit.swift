//
//  UIView+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/10/16.
//
//

import Foundation

public extension UIView {
    
    func ck_whenTouches(touches:Int,taps:Int, handler:()->()) {
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.numberOfTouchesRequired = touches
        tapRecognizer.numberOfTapsRequired = taps
        tapRecognizer.addTarget(self, action: #selector(ck_onTapped))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    @objc private func ck_onTapped(){
        print("execute handler")
//        handler()
    }
    
    public func ck_whenTapped() {
        ck_whenTouches(1, taps: 1) { 
            print("View is tapped")
        }
    }
    
}