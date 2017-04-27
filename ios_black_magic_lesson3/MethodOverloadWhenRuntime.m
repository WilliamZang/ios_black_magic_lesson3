//
//  MethodOverloadWhenRuntime.m
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/4/21.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#import "MethodOverloadWhenRuntime.h"
//@import ObjectiveC.runtime;
//
//@interface A : NSObject
//@end
//
//@interface B : A
//- (void)test;
//@end
//
//@interface C : B
//- (void)test;
//@end
//
//@interface Child : C
//@end
//
//@implementation B
//- (void)test {
//    NSLog(@"B Class test method");
//}
//@end
//typedef void(*Function)(id iself, SEL sel);
//@implementation C
//- (void)test {
//    unsigned int count;
//    Method *methodsList = class_copyMethodList(self.class.superclass, &count);
//    for (int i = 0; i < count; i++) {
//        IMP imp = method_getImplementation(methodsList[i]);
//        SEL sel = method_getName(methodsList[i]);
//        if (strcmp(sel_getName(sel), "test")) {
//            Function func = (Function)imp;
//            func(self,sel);
//        }
//    }
//}
//@end
