//
//  runtime_test3.m
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/4/27.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Expecta/Expecta.h>
#import <Specta/Specta.h>
#import <objc/runtime.h>

#import "MethodOverload.h"

SpecBegin(runtime_test3)

describe(@"runtime_test", ^{
    it(@"test overload", ^{
        Class2 *c = [Class2 new];
        int result = [c method2:15 with:20];
        expect(result).to.equal(35);
        
    });
    
    it(@"test overload using msgSendSuper", ^{
        Class2 *c = [Class2 new];
        int result = [c method2$:15 with:20];
        expect(result).to.equal(35);
        
    });
});
SpecEnd
