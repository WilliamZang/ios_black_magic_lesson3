//
//  runtime_test2.m
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/4/21.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Expecta/Expecta.h>
#import <Specta/Specta.h>
#import <objc/runtime.h>

#import "PrivateVariables.h"

SpecBegin(runtime_test2)

describe(@"runtime_test", ^{    
    it(@"is allowed access private variables", ^{
        PrivateVariables *object = [PrivateVariables new];
        
        NSString *ivar1 = [object valueForKey:@"privateIvar1"];
        
        expect(ivar1).to.equal(@"secret");
        
        unsigned int ivarCount = 0;
        Ivar *ivars = class_copyIvarList(object.class, &ivarCount);
        NSMutableDictionary *testIvar = [@{@"f": @NO, @"struct": @NO, @"id": @NO} mutableCopy];
        for (int i = 0; i < ivarCount; ++i) {
            Ivar ivar = ivars[i];
            const char *type = ivar_getTypeEncoding(ivar);
            NSString *typeString = [NSString stringWithUTF8String:type];
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF like $TYPE"];
            if ([predicate evaluateWithObject:typeString substitutionVariables:@{@"TYPE": @"f"} ]) {
                float f = 0.0f;
                ptrdiff_t offset = ivar_getOffset(ivar);
                f = *(float *)((__bridge void *)object + offset);
                
                expect(f).to.equal(1.05f);
                testIvar[@"f"] = @YES;
            }
            if ([predicate evaluateWithObject:typeString substitutionVariables:@{@"TYPE": @"{CGRect*"} ]) {
                CGRect rect = CGRectZero;
                ptrdiff_t offset = ivar_getOffset(ivar);
                rect = *(CGRect *)((__bridge void *)object + offset);
                
                expect(rect).to.equal(CGRectMake(15, 15, 20, 20));
                
                testIvar[@"struct"] = @YES;
            }
            if ([predicate evaluateWithObject:typeString substitutionVariables:@{@"TYPE": @"@\"NSDictionary\""} ]) {
                NSString *str = object_getIvar(object, ivar);
                expect(str).to.equal(@{@"key": @"value"});
                testIvar[@"id"] = @YES;
            }
        }
        expect(testIvar).to.equal(@{@"f": @YES, @"struct": @YES, @"id": @YES});
        free(ivars);
        
        
    });
});
SpecEnd

void breakPropertyEncapsulation(NSObject *object){
    //利用propertyAPI
    unsigned int propertysCount;
    objc_property_t *propertyList = class_copyPropertyList(object.class, &propertysCount);
    for (int i = 0; i < propertysCount; i++) {
        objc_property_t property = propertyList[i];
        
        //取得属性名
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        //利用kvc获取成员变量
        id ivar = [object valueForKey:propertyName];
    }
}
