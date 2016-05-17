//
//  Object+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/11/16.
//
//

import Foundation
import ObjectiveC


/*
 Notice:
 
 The comment in this file is originally from BlocksKit.
 ClosuresKit shares the same reasoning while applying objc runtime here.
 The codes currently is just a wrapper for runtime. Codes and comments will be updated if I achieve better understanding of oc runtime.
 
 Charlie 2016 5 17
 */

public extension NSObject {
    
    /** Strongly associates an object with the reciever.
     
     The associated value is retained as if it were a property
     synthesized with `nonatomic` and `retain`.
     
     Using retained association is strongly recommended for most
     Objective-C object derivative of NSObject, particularly
     when it is subject to being externally released or is in an
     `NSAutoreleasePool`.
     
     @param value Any object.
     @param key A unique key pointer.
     */
    func ck_associateValue(value:AnyObject, key:UnsafePointer<Void>) {
        objc_setAssociatedObject(self,key,value,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    /** Strongly, thread-safely associates an object with the reciever.
     
     The associated value is retained as if it were a property
     synthesized with `atomic` and `retain`.
     
     Using retained association is strongly recommended for most
     Objective-C object derivative of NSObject, particularly
     when it is subject to being externally released or is in an
     `NSAutoreleasePool`.
     
     @see associateValue:withKey:
     @param value Any object.
     @param key A unique key pointer.
     */
    func ck_atomicallyAssociateValue(value:AnyObject, key:UnsafePointer<Void>) {
        objc_setAssociatedObject(self,key,value,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    /** Associates a copy of an object with the reciever.
     
     The associated value is copied as if it were a property
     synthesized with `nonatomic` and `copy`.
     
     Using copied association is recommended for a block or
     otherwise `NSCopying`-compliant instances like NSString.
     
     @param value Any object, pointer, or value.
     @param key A unique key pointer.
     */
    func ck_associateCopyOfValue(value:AnyObject, key:UnsafePointer<Void>) {
        objc_setAssociatedObject(self,key,value,objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
    }
    
    /** Thread-safely associates a copy of an object with the reciever.
     
     The associated value is copied as if it were a property
     synthesized with `atomic` and `copy`.
     
     Using copied association is recommended for a block or
     otherwise `NSCopying`-compliant instances like NSString.
     
     @see associateCopyOfValue:withKey:
     @param value Any object, pointer, or value.
     @param key A unique key pointer.
     */
    func ck_atomicallyAssociateCopyOfValue(value:AnyObject, key:UnsafePointer<Void>) {
        objc_setAssociatedObject(self,key,value,objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
    }
    
    
    /** Returns the associated value for a key on the reciever.
     
     @param key A unique key pointer.
     @return The object associated with the key, or `nil` if not found.
     */
    func ck_associatedValueForKey(key:UnsafePointer<Void>) -> AnyObject? {
        return objc_getAssociatedObject(self, key)
    }
    
    /** Returns the reciever to a clean state by removing all
     associated objects, releasing them if necessary. */
    func ck_removeAllAssociatedObjects() {
        objc_removeAssociatedObjects(self)
    }
}