//
//  Array+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/9/16.
//
//

import Foundation

public extension Array {

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
    
    /** Loops through an array to find the objects not matching the closure. This selector performs *literally* the exact same function as ck_select: but in reverse. This is useful, as one may expect, for removing objects from an array.
     
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
     let strs = ["hello","swift","charlie"]
     let ret = strs.ck_map { (obj) -> String in
     return obj.stringByAppendingString(".avi")
     }
     
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
}