//
//  UIGestureRecognizer+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/11/16.
//
//

import Foundation

public typealias CKHandler = ()->()

private class ClosureWrapper:NSObject, NSCopying {
    
    var closure:CKHandler?
    
    convenience init(closure: CKHandler?) {
        
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
    
    internal var ck_handler:CKHandler? {
        get {
            if let wrapper = ck_associatedValueForKey(AssociatedKeys.CKGestureActionKey) as? ClosureWrapper{
                return wrapper.closure
            }
            return nil
        }
        set {
            ck_associateValue(ClosureWrapper(closure: newValue), key: AssociatedKeys.CKGestureActionKey)
        }
    }

    //Mark : - initializer
    
    public convenience init(handler: CKHandler) {
        self.init()
        
        self.ck_handler = handler
        self.addTarget(self, action: #selector(UIGestureRecognizer.handleAction))
    }
    
    @objc private func handleAction() {
        self.ck_handler!()
    }
}