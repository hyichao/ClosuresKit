//
//  Dictionary+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/10/16.
//
//

import Foundation

public extension Dictionary {
    
    /** Loops through the dictionary and executes the given closure using each item.
     
     @param closure A closure that performs an action using a key/value pair.
     */
    func ck_each(execute:(Element)->()) {
        for element in self {
            execute(element)
        }
    }
        
    /** Loops through a dictionary to find the first key/value pair matching the closure.
     
     ck_match: is functionally identical to ck_select:, but will stop and return
     the value on the first match.
     
     @param closure A BOOL-returning code closure for a key/value pair.
     @return The value of the first pair found;
     */
    func ck_match(execute:(Element)->(Bool))->Element? {
        for element in self {
            if execute(element) {
                return element
            }
        }
        return nil
    }
    
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
    
    /** Loops through a dictionary to find the key/value pairs not matching the closure.
     
     This selector performs *literally* the exact same function as ck_select: but in reverse.
     
     This is useful, as one may expect, for filtering objects.
     NSDictionary *strings = [userData ck_reject:^BOOL(id key, id value) {
     return ([obj isKindOfClass:[NSString class]]);
     }];
     
     @param closure A BOOL-returning code closure for a key/value pair.
     @return Returns a dictionary of all objects not found.
     */
    func ck_reject(execute:(Element)->(Bool))->Dictionary {
        return ck_select({ (obj) -> (Bool) in
            return !execute(obj)
        })
    }
    
    /** Call the closure once for each object and create a dictionary with the same keys
     and a new set of values.
     
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
    
    /** Loops through a dictionary to find whether any key/value pair matches the closure.
     
     This method is similar to the Scala list `exists`. It is functionally
     identical to ck_match: but returns a `BOOL` instead. It is not recommended
     to use ck_any: as a check condition before executing ck_match:, since it would
     require two loops through the dictionary.
     
     @param closure A two-argument, BOOL-returning code closure.
     @return YES for the first time the closure returns YES for a key/value pair, NO otherwise.
     */
    func ck_any(execute:(Element)->(Bool)) -> Bool {
        return ck_match(execute) != nil
    }
    
    /** Loops through a dictionary to find whether no key/value pairs match the closure.
     
     This selector performs *literally* the exact same function as ck_all: but in reverse.
     
     @param closure A two-argument, BOOL-returning code closure.
     @return YES if the closure returns NO for all key/value pairs in the dictionary, NO otherwise.
     */
    func ck_none(execute:(Element)->(Bool)) -> Bool {
        return ck_match(execute) == nil
    }
    
    /** Loops through a dictionary to find whether all key/value pairs match the closure.
     
     @param closure A two-argument, BOOL-returning code closure.
     @return YES if the closure returns YES for all key/value pairs in the dictionary, NO otherwise.
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