//
//  UIView+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/10/16.
//
//

import Foundation

public extension UIView {
    
    // MARK: - Tap
    
    public func ck_whenTapped(handler:()->()) {
        ck_whenTouches(1, taps: 1, handler: handler)
    }
    
    public func ck_whenDoubleTapped(handler:()->()) {
        ck_whenTouches(1, taps: 2, handler: handler)
    }
    
    private func ck_whenTouches(touches:Int,taps:Int, handler:()->()) {
        
        let tapRecognizer = UITapGestureRecognizer(handler: handler)
        tapRecognizer.numberOfTouchesRequired = touches
        tapRecognizer.numberOfTapsRequired = taps
        self.addGestureRecognizer(tapRecognizer)
    }
    
    // MARK: - Long Pressed
    
    public func ck_whenLongPressed(handler:()->()){
        
        let longPressRecognizer = UILongPressGestureRecognizer(handler:handler)
        self.addGestureRecognizer(longPressRecognizer)
    }
}
