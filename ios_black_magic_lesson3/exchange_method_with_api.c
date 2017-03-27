//
//  exchange_method_with_api.c
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/3/12.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#include "exchange_method_with_api.h"

int testMethod3(id self, SEL cmd) {
    return 17;
}


void exchange_method_with_api(id obj) {
    Class class = object_getClass(obj);
    unsigned int count = 0;
    Method *methods = class_copyMethodList(class, &count);
    if (count != 1) return;
    Method method = methods[0];
    method_setImplementation(method, (IMP)testMethod3);
}
