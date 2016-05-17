//
//  Dictionary+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/10/16.
//
//

import Foundation

public extension Dictionary {
    
    /** Loops through a dictionary to find the key/value pairs matching the closure.
     
     @param closure A BOOL-returning code closure for a key/value pair.
     @return Returns a dictionary of the objects found.
     */
    func ck_select(execute:(Element)->(Bool)) -> Dictionary {
        var retDict:Dictionary = Dictionary<Key,Value>()
        for element in self {
            if execute(element) {
                var (k, v) = element
                retDict[k] = v
            }
        }
        return retDict
    }
    
    /** Loops through a dictionary to find the key/value pairs not matching the closure. This selector performs *literally* the exact same function as ck_select: but in reverse. This is useful, as one may expect, for filtering objects.
     
     @param closure A BOOL-returning code closure for a key/value pair.
     @return Returns a dictionary of all objects not found.
     */
    func ck_reject(execute:(Element)->(Bool))->Dictionary {
        return ck_select({ (obj) -> (Bool) in
            return !execute(obj)
        })
    }
    
    /** Call the closure once for each object and create a dictionary with the same keys and a new set of values.
     
     @param closure A closure that returns a new value for a key/value pair.
     @return Returns a dictionary of the objects returned by the closure.
     */
    func ck_map(execute:(Element)->(Element?))->Dictionary {
        var retDict:Dictionary = Dictionary<Key,Value>()
        for element in self {
            let (k,v) = execute(element)!
            retDict[k] = v
        }
        return retDict
    }
}