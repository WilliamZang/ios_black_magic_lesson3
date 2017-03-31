//
//  DynamicBinding.m
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/3/31.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#import "DynamicBinding.h"

#define CONCAT(A, B) A##B
@implementation OCSomeClassA

- (void)func1
{
    NSString *string = [NSString stringWithUTF8String:__FUNCTION__];
    NSLog(@"%@", string);
}
@end

@implementation OCSomeClassB

- (void)func2
{
    NSString *string = [NSString stringWithUTF8String:__FUNCTION__];
    NSLog(@"%@", string);
}

@end

void testOC1()
{
    OCSomeClassA *a = [OCSomeClassA new];
    [a func1];
}

void testOC2()
{
    OCSomeClassA *a = [OCSomeClassA new];
    OCSomeClassB *b = (OCSomeClassB *)a;
    
    [b func2];
    
}
