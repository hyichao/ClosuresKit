//
//  Array+ClosuresKit.swift
//  Pods
//
//  Created by HuangCharlie on 5/9/16.
//
//

import Foundation

public extension Array
{
    func ck_each(execute: ()->()) {
        print("Iterate Array and perform closure")
        execute()
    }
    
    func ck_map(execute: ()->Array)->Array {
        print("Iterate Array and select matched elements")
        return execute();
    }
    
    func ck_all()->Array{
        return self
    }
}