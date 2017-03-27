//
//  exchange_method_with_no_api.c
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/3/10.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#include "exchange_method_no_api.h"


int testMethod2(void *_, void *__) {
    return 16;
}

void exchange_method_no_api(void *obj) {

    void *p1 = *(void **)obj;
    void *p2 = (void *)(*(long *)(p1 + 0x20) & (unsigned long)(-7));
    void *p3 = (void *)*(long *)(p2 + 0x10) + 0x8;
    typedef int (*M)(void *, void *);
    M *m = (M *)(p3 + 0x10);
    *m = &testMethod2;
    
}
