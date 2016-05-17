//
//  Set+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/10/16.
//
//

import Foundation

public extension Set {
    
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
    
    /** Loops through a set to find the objects not matching the closure. This selector performs *literally* the exact same function as select, but in reverse. This is useful, as one may expect, for removing objects from a set.
     
     @param closure A single-argument, BOOL-returning code closure.
     @return Returns an array of all objects not found.
     */
    func ck_reject(execute:(Element)->(Bool))->Set {
        return ck_select({ (obj) -> (Bool) in
            return !execute(obj)
        })
    }
    
    /** Call the closure once for each object and create a set of the return values. This is sometimes referred to as a transform, mutating one of each object:
     
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
}