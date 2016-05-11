//
//  UIView+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/10/16.
//
//

import Foundation
import ObjectiveC

private class UIViewClosureWrapper:NSObject, NSCopying {
    
    var closure:CKHandler?
    
    convenience init(closure: CKHandler?) {
        
        self.init()
        self.closure = closure
    }
    
    @objc func copyWithZone(zone: NSZone) -> AnyObject {
        
        var wrapper: UIViewClosureWrapper = UIViewClosureWrapper()
        wrapper.closure = closure
        
        return wrapper
    }
}

public extension UIView {
    
    // MARK: - add property by oc-runtime
    
    private struct AssociatedKeys {
        static var CKTapGestureActionKey = "CKTapGestureActionKey"
        static var CKDoubleTapGestureActionKey = "CKDoubleTapGestureActionKey"
        static var CKLongPressActionKey = "CKLongPressActionKey"
    }
    
    internal var ck_tapHandler:CKHandler? {
        get {
            if let wrapper = objc_getAssociatedObject(self, &AssociatedKeys.CKTapGestureActionKey) as? UIViewClosureWrapper {
                return wrapper.closure
            }
            return nil
        }
        set {
            objc_setAssociatedObject(self,&AssociatedKeys.CKTapGestureActionKey,UIViewClosureWrapper(closure: newValue),objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    internal var ck_longPressHandler:CKHandler? {
        get {
            if let wrapper = objc_getAssociatedObject(self, &AssociatedKeys.CKLongPressActionKey) as? UIViewClosureWrapper {
                return wrapper.closure
            }
            return nil
        }
        set {
            objc_setAssociatedObject(self,&AssociatedKeys.CKLongPressActionKey,UIViewClosureWrapper(closure: newValue),objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: - Tap
    
    public func ck_whenTapped(handler:()->()) {
        ck_whenTouches(1, taps: 1, handler: handler)
    }
    
    public func ck_whenDoubleTapped(handler:()->()) {
        ck_whenTouches(2, taps: 2, handler: handler)
    }
    
    private func ck_whenTouches(touches:Int,taps:Int, handler:()->()) {
        
        self.ck_tapHandler = handler
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.numberOfTouchesRequired = touches
        tapRecognizer.numberOfTapsRequired = taps
        tapRecognizer.addTarget(self, action: #selector(ck_onTapped))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    @objc private func ck_onTapped(){
        print("execute handler")
        self.ck_tapHandler!()
    }
    
    // MARK: - Long Pressed
    
    public func ck_whenLongPressed(handler:()->()){
        
        self.ck_longPressHandler = handler
        
        let longPressRecognizer = UILongPressGestureRecognizer()
        longPressRecognizer.addTarget(self, action: #selector(ck_onLongPress))
        self.addGestureRecognizer(longPressRecognizer)
    }
    
    @objc private func ck_onLongPress(){
        print("execute handler")
        self.ck_longPressHandler!()
    }
    
}
