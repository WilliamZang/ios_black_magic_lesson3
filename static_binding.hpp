//
//  static_binding.hpp
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/3/31.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#ifndef static_binding_hpp
#define static_binding_hpp

#include <stdio.h>

class SomeClassA {
    int var1;
public:
    void func1();
};

class SomeClassB {
    int var2;
public:
    void func2();
};

void testCpp1();
void testCpp2();
#endif /* static_binding_hpp */
