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
    /** Loops through an array and executes the given closures with each object.
     @param block A single-argument, void-returning code block.
     */
    func ck_each(execute: (obj:Element)->()) {
        print("Iterate Array and perform closure")
        
        if self.isEmpty {
            return
        }
        
        for element in self {
            execute(obj: element)
        }
    }
    
    func ck_match(execute: (obj:Element)->(Bool))->Element? {
        print("Iterate Array and select matched elements")
        
        for element in self {
            if(execute(obj: element)){
                return element
            }
        }
        return nil;
    }

    func ck_select(execute:(obj:Element)->Array<Element>) {
        //TODO for charlie
    }
    
    
    
//    - (NSArray *)bk_reject:(BOOL (^)(id obj))block
//    {
//    NSParameterAssert(block != nil);
//    return [self bk_select:^BOOL(id obj) {
//    return !block(obj);
//    }];
//    }
//    
//    - (NSArray *)bk_map:(id (^)(id obj))block
//    {
//    NSParameterAssert(block != nil);
//    
//    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
//    
//    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//    id value = block(obj) ?: [NSNull null];
//    [result addObject:value];
//    }];
//    
//    return result;
//    }
//    
//    - (NSArray *)bk_compact:(id (^)(id obj))block
//    {
//    NSParameterAssert(block != nil);
//    
//    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
//    
//    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//    id value = block(obj);
//    if(value)
//    {
//    [result addObject:value];
//    }
//    }];
//    
//    return result;
//    }
//    
//    - (id)bk_reduce:(id)initial withBlock:(id (^)(id sum, id obj))block
//    {
//    NSParameterAssert(block != nil);
//    
//    __block id result = initial;
//    
//    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//    result = block(result, obj);
//    }];
//    
//    return result;
//    }
//    
//    - (NSInteger)bk_reduceInteger:(NSInteger)initial withBlock:(NSInteger (^)(NSInteger, id))block
//    {
//    NSParameterAssert(block != nil);
//    
//    __block NSInteger result = initial;
//    
//    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//    result = block(result, obj);
//    }];
//    
//    return result;
//    }
//    
//    - (CGFloat)bk_reduceFloat:(CGFloat)inital withBlock:(CGFloat (^)(CGFloat, id))block
//    {
//    NSParameterAssert(block != nil);
//    
//    __block CGFloat result = inital;
//    
//    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//    result = block(result, obj);
//    }];
//    
//    return result;
//    }
//    
//    - (BOOL)bk_any:(BOOL (^)(id obj))block
//    {
//    return [self bk_match:block] != nil;
//    }
//    
//    - (BOOL)bk_none:(BOOL (^)(id obj))block
//    {
//    return [self bk_match:block] == nil;
//    }
//    
//    - (BOOL)bk_all:(BOOL (^)(id obj))block
//    {
//    NSParameterAssert(block != nil);
//    
//    __block BOOL result = YES;
//    
//    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//    if (!block(obj)) {
//    result = NO;
//    *stop = YES;
//    }
//    }];
//    
//    return result;
//    }
//    
//    - (BOOL)bk_corresponds:(NSArray *)list withBlock:(BOOL (^)(id obj1, id obj2))block
//    {
//    NSParameterAssert(block != nil);
//    
//    __block BOOL result = NO;
//    
//    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//    if (idx < list.count) {
//    id obj2 = list[idx];
//    result = block(obj, obj2);
//    } else {
//    result = NO;
//    }
//    *stop = !result;
//    }];
//    
//    return result;
//    }

    
}