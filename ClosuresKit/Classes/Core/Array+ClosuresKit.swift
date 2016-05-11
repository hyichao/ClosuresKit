//
//  Array+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/9/16.
//
//

import Foundation

public extension Array {
    
    /** Loops through an array and executes the given closures with each object.
     @param: A single-argument, void-returning closure
     */
    func ck_each(execute: (Element)->()) {
        for element in self {
            execute(element)
        }
    }
    
    /** Loops through an array to find the first object matching the closure.
     
     ck_match: is functionally identical to ck_select:, but will stop and return
     on the first match.
     
     @param closure A single-argument, `BOOL`-returning code closure.
     @return Returns the object, if found, or `nil`.
     @see ck_select:
     */
    func ck_match(execute: (Element)->(Bool))->Element? {
        for element in self {
            if(execute(element)){
                return element
            }
        }
        return nil;
    }

    /** Loops through an array to find the objects matching the closure.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return Returns an array of the objects found.
     @see ck_match:
     */
    func ck_select(execute:(Element)->Bool)->Array<Element> {
        var retArray:Array = []
        for element in self {
            if execute(element) {
                retArray.append(element)
            }
        }
        return retArray
    }
    
    /** Loops through an array to find the objects not matching the closure.
     
     This selector performs *literally* the exact same function as ck_select: but in reverse.
     
     This is useful, as one may expect, for removing objects from an array.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return Returns an array of all objects not found.
     */
    func ck_reject(execute:(Element)->Bool)->Array<Element> {
        return ck_select({ (obj) -> Bool in
            return !execute(obj)
        })
    }
    
    /** Call the closure once for each object and create an array of the return values.
     
     This is sometimes referred to as a transform, mutating one of each object:
     NSArray *new = [stringArray ck_map:^id(id obj) {
     return [obj stringByAppendingString:@".png"]);
     }];
     
     @param closure A single-argument, object-returning code closure.
     @return Returns an array of the objects returned by the closure.
     */
    func ck_map(execute:(Element)->Element)->Array<Element> {
        var retArray:Array = []
        for element in self {
            var newElement = execute(element)
            retArray.append(newElement)
        }
        return retArray
    }
    
    /** Behaves like map, but doesn't add NSNull objects if you return nil in the closure.
     Deprecated currently, exactly the same with ck_map:
     
     @param closure A single-argument, object-returning code closure.
     @return Returns an array of the objects returned by the closure.
     */
    func ck_compact(execute:(Element)->Element)->Array<Element> {
        var retArray:Array = []
        for element in self {
            var newElement = execute(element)
            retArray.append(newElement)
        }
        return retArray
    }

    /** Loops through an array to find whether any object matches the closure.
     
     It is functionally identical to ck_match: but returns a `BOOL` instead. It is not recommended to use ck_any: as a check condition before executing ck_match:, since it would require two loops through the array.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return YES for the first time the closure returns YES for an object, NO otherwise.
     */
    func ck_any(execute:(Element)->Bool)->Bool {
        return ck_match(execute) != nil
    }
    
    /** Loops through an array to find whether no objects match the closure.
     
     This function performs *literally* the exact same function as ck_all: but in reverse.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return YES if the closure returns NO for all objects in the array, NO otherwise.
     */
    func ck_none(execute:(Element)->Bool)->Bool{
        return ck_match(execute) == nil
    }
    
    /** Loops through an array to find whether all objects match the closure.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return YES if the closure returns YES for all objects in the array, NO otherwise.
     */
    func ck_all(execute:(Element)->Bool)->Bool{
        var ret = true
        for element in self {
            if !execute(element) {
                ret = false
                break
            }
        }
        return ret
    }
}