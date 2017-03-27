//
//  runtime_no_api.m
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/3/10.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Expecta/Expecta.h>
#import <Specta/Specta.h>
#import "TestClass.h"
#import "exchange_method_with_api.h"

void exchange_method_no_api(id obj);

SpecBegin(runtime_no_api)

describe(@"runtime_no_api_test", ^{
    it(@"can exchange method without using api", ^{
        id test = [TestClass new];
        exchange_method_no_api(test);
        expect([test testMethod]).to.equal(16);
    });
    
    it(@"can exchange method using api", ^{
        id test = [TestClass new];
        expect([test testMethod]).to.equal(16);
        exchange_method_with_api(test);
        expect([test testMethod]).to.equal(17);
    });
});
SpecEnd
