//
//  CollectionType+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/17/16.
//
//

import Foundation

public extension CollectionType {
    
    /** Loops through a CollectionType (Array, Dictionary, Set) and executes the given closures with each object.
     @param: A single-argument, void-returning closure
     */
    func ck_each(execute: (Self.Generator.Element)->()) {
        for element in self {
            execute(element)
        }
    }
    
    /** Loops through an CollectionType (Array, Dictionary, Set) to find the first object matching the closure.
     
     @param closure A single-argument, `BOOL`-returning code closure.
     @return Returns the object, if found, or `nil`.
     @see ck_select:
     */
    func ck_match(execute: (Self.Generator.Element)->(Bool))->Self.Generator.Element? {
        for element in self {
            if(execute(element)){
                return element
            }
        }
        return nil;
    }
    
    /** Loops through an CollectionType (Array, Dictionary, Set) to find whether any object matches the closure.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return YES for the first time the closure returns YES for an object, NO otherwise.
     */
    func ck_any(execute:(Self.Generator.Element)->Bool)->Bool {
        return ck_match(execute) != nil
    }
    
    /** Loops through an CollectionType (Array, Dictionary, Set) to find whether no objects match the closure. This function performs *literally* the exact same function as ck_all: but in reverse.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return YES if the closure returns NO for all objects in the array, NO otherwise.
     */
    func ck_none(execute:(Self.Generator.Element)->Bool)->Bool{
        return ck_match(execute) == nil
    }
    
    /** Loops through an CollectionType (Array, Dictionary, Set) to find whether all objects match the closure.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return YES if the closure returns YES for all objects in the array, NO otherwise.
     */
    func ck_all(execute:(Self.Generator.Element)->Bool)->Bool{
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
