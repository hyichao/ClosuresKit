//
//  Set+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/10/16.
//
//

import Foundation

public extension Set {
    
    /** Loops through a set and executes the given closure with each object.
     
     @param closure A single-argument, void-returning code closure.
     */
    func ck_each(execute:(Element)->()) {
        for element in self {
            execute(element)
        }
    }
    
    /** Loops through a set to find the object matching the closure.
     
     ck_match: is functionally identical to ck_select:, but will stop and return
     on the first match.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return Returns the object if found, `nil` otherwise.
     @see ck_select:
     */
    func ck_match(execute:(Element)->(Bool))->Element? {
        for element in self {
            if execute(element) {
                return element
            }
        }
        return nil
    }
    
    /** Loops through a set to find the objects matching the closure.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return Returns a set of the objects found.
     @see ck_match:
     */
    func ck_select(execute:(Element)->(Bool)) -> Set {
        var retSet = Set<Element>()
        for element in self {
            if execute(element) {
                retSet.insert(element)
            }
        }
        return retSet
    }
    
    /** Loops through a set to find the objects not matching the closure.
     
     This selector performs *literally* the exact same function as select, but in reverse.
     
     This is useful, as one may expect, for removing objects from a set:
     NSSet *new = [reusableWebViews ck_reject:^BOOL(id obj) {
     return ([obj isLoading]);
     }];
     
     @param closure A single-argument, BOOL-returning code closure.
     @return Returns an array of all objects not found.
     */
    func ck_reject(execute:(Element)->(Bool))->Set {
        return ck_select({ (obj) -> (Bool) in
            return !execute(obj)
        })
    }
    
    /** Call the closure once for each object and create a set of the return values.
     
     This is sometimes referred to as a transform, mutating one of each object:
     NSSet *new = [mimeTypes ck_map:^id(id obj) {
     return [@"x-company-" stringByAppendingString:obj]);
     }];
     
     @param closure A single-argument, object-returning code closure.
     @return Returns a set of the objects returned by the closure.
     */
    func ck_map(execute:(Element)->(Element?))->Set {
        var retSet = Set()
        for element in self {
            retSet.insert(execute(element)!)
        }
        return retSet
    }
    
    
    /** Loops through a set to find whether any object matches the closure.
     
     This method is similar to the Scala list `exists`. It is functionally
     identical to ck_match: but returns a `BOOL` instead. It is not recommended
     to use ck_any: as a check condition before executing ck_match:, since it would
     require two loops through the array.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return YES for the first time the closure returns YES for an object, NO otherwise.
     */
    func ck_any(execute:(Element)->(Bool)) -> Bool {
        return ck_match(execute) != nil
    }
    
    /** Loops through a set to find whether no objects match the closure.
     
     This selector performs *literally* the exact same function as ck_all: but in reverse.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return YES if the closure returns NO for all objects in the set, NO otherwise.
     */
    func ck_none(execute:(Element)->(Bool)) -> Bool {
        return ck_match(execute) == nil
    }
    
    /** Loops through a set to find whether all objects match the closure.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return YES if the closure returns YES for all objects in the set, NO otherwise.
     */
    func ck_all(execute:(Element)->(Bool))->Bool {
        var flag = true
        for element in self {
            if !execute(element) {
                flag = false
                break
            }
        }
        return flag
    }
}