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
#import <objc/runtime.h>
#import "TestClass.h"
#import "exchange_method_with_api.h"
#import "static_binding.hpp"
#import "DynamicBinding.h"
#import "TestVarOrProperty.h"

extern "C" {
    void exchange_method_no_api(id obj);
}

SpecBegin(runtime_test)

describe(@"runtime_test", ^{
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
    
    it(@"test cpp", ^{
        testCpp1();
        testCpp2();
    });
    
    it(@"test oc", ^{
        testOC1();
        int a = 0;
        @try {
            testOC2();
        } @catch(NSException *e) {
            a = 1;
        }
        expect(a).to.equal(1);
    });
    
    it(@"use c string as a SEL", ^{
        NSObject *a = [NSObject new];
        NSObject *b = [NSObject new];
        
        [a addObserver:b forKeyPath:@"c" options:NSKeyValueObservingOptionNew context:NULL];
        [a removeObserver:b forKeyPath:@"c"];
        SEL sel = @selector(addObserver:forKeyPath:options:context:);
        const char *cstring = (const char *)sel;
        NSString *string = [NSString stringWithUTF8String:cstring];
        expect(string).to.equal(@"addObserver:forKeyPath:options:context:");
        
        int c = 0;
        @try {
            OCSomeClassB *b = [OCSomeClassB new];
            [b performSelector:(SEL)"func2"];
        } @catch(NSException *e) {
            c = 1;
        }
        
        expect(c).to.equal(1);
        
    });
    
    it(@"test method signature", ^{
        
        Method method = class_getInstanceMethod([NSObject class], @selector(addObserver:forKeyPath:options:context:));
        const char *type = method_getTypeEncoding(method);
        NSString *s = [NSString stringWithUTF8String:type];
        expect(s).to.equal(@"v48@0:8@16@24Q32^v40");
        
        Method method2 = class_getInstanceMethod([UIView class], @selector(initWithFrame:));
        NSString *s2 = [NSString stringWithUTF8String:method_getTypeEncoding(method2)];
        expect(s2).to.equal(@"@48@0:8{CGRect={CGPoint=dd}{CGSize=dd}}16");
        
    });
    
    it(@"found isa or class found superclass", ^{
        NSObject *obj = [NSObject new];
        Class classOfObj = object_getClass(obj);
        Class metaClass = object_getClass(classOfObj);
        Class superClass = class_getSuperclass(classOfObj);
        
    });
    
    it(@"is different from variable with property", ^{
        TestVarOrProperty *obj = [TestVarOrProperty new];
        int var1 = obj->var1;
        id obj2 = obj.prop1;
        id obj3 = [obj prop1];
        [obj setProp1:nil];
        
        Ivar ivar = class_getInstanceVariable([TestVarOrProperty class], "var1");
        NSLog(@"Offset: %d", ivar_getOffset(ivar));
        
        [[TestVarOrProperty alloc] init];
    });
});
SpecEnd
