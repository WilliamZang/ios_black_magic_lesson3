//
//  MethodOverload.m
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/4/21.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#import "MethodOverload.h"
@import ObjectiveC;




@implementation Class1
- (int)method2:(int)param1 with:(int)param2;
{
    NSLog(@"%s", __FUNCTION__);
    return param1 + param2;
}
@end

typedef int (*Function)(id iself, SEL sel, int param1, int param2);

@implementation Class2

- (int)method2:(int)param1 with:(int)param2;
{
    NSLog(@"%s", __FUNCTION__);
    unsigned int count;
    Method *methodsList = class_copyMethodList([Class1 class], &count);
    for (int i = 0; i < count; i++) {
        IMP imp = method_getImplementation(methodsList[i]);
        SEL sel = method_getName(methodsList[i]);
        if (strcmp(sel_getName(sel), "method2:with:") == 0) {
            Function func = (Function)imp;
            return func(self,sel, param1, param2);
        }
    }
    return -1;
}

- (int)method2$:(int)param1 with:(int)param2
{
    struct objc_super super_struct = {
        .receiver = self,
        .super_class = [Class1 class]
    };
    typedef int *MyObjc_msgSendSuper(struct objc_super *, SEL, int, int);
    MyObjc_msgSendSuper *func = &objc_msgSendSuper;
    return func(&super_struct, @selector(method2:with:), param1, param2);
}

- (int)method2$$:(int)param1 with:(int)param2
{
    return [super method2:param1 with:param2];
}

- (int)method2$$$:(int)param1 with:(int)param2;
{
    NSLog(@"%s", __FUNCTION__);
    unsigned int count;
    Method *methodsList = class_copyMethodList(self.class.superclass, &count);
    for (int i = 0; i < count; i++) {
        IMP imp = method_getImplementation(methodsList[i]);
        SEL sel = method_getName(methodsList[i]);
        if (strcmp(sel_getName(sel), "method2:with:") == 0) {
            Function func = (Function)imp;
            return func(self,sel, param1, param2);
        }
    }
    return -1;
}

@end
