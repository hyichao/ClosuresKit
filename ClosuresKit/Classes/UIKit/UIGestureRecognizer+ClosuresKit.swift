//
//  UIGestureRecognizer+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/11/16.
//
//

import Foundation

public typealias CKGestureHandler = ()->()

private class ClosureWrapper:NSObject, NSCopying {
    
    var closure:CKGestureHandler?
    
    convenience init(closure: CKGestureHandler?) {
        
        self.init()
        self.closure = closure
    }
    
    @objc func copyWithZone(zone: NSZone) -> AnyObject {
        
        var wrapper: ClosureWrapper = ClosureWrapper()
        wrapper.closure = closure
        
        return wrapper
    }
}

public extension UIGestureRecognizer {
    
    private struct AssociatedKeys {
        static var CKGestureActionKey = "CKGestureActionKey"
    }
    
    internal var ck_handler:CKGestureHandler? {
        get {
            if let wrapper = ck_associatedValueForKey(&AssociatedKeys.CKGestureActionKey) as? ClosureWrapper{
                return wrapper.closure
            }
            return nil
        }
        set {
            ck_associateValue(ClosureWrapper(closure: newValue),
                              key: &AssociatedKeys.CKGestureActionKey)
        }
    }

    //Mark : - initializer
    
    public convenience init(handler: CKGestureHandler) {
        self.init()
        
        self.ck_handler = handler
        self.addTarget(self, action: #selector(UIGestureRecognizer.handleAction))
    }
    
    @objc private func handleAction() {
        self.ck_handler!()
    }
}