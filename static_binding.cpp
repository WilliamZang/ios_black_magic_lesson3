//
//  static_binding.cpp
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/3/31.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#include "static_binding.hpp"
#include <iostream>

void SomeClassA::func1() {
    std::cout << __FUNCTION__ << std::endl;
}

void SomeClassB::func2() {
    std::cout << __FUNCTION__ << std::endl;
}

void testCpp1() {
    SomeClassA a = SomeClassA();
    a.func1();
}

void testCpp2() {
    SomeClassA a = SomeClassA();
    SomeClassB *b = reinterpret_cast<SomeClassB *>(&a);
    b->func2();
}
