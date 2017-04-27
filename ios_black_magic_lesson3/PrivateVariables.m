//
//  PrivateVariables.m
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/4/21.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#import "PrivateVariables.h"
@import UIKit;

@interface PrivateVariables () {
    float privateIvar2;
}
@end

@implementation PrivateVariables {
    NSDictionary *privateIvar3;
    CGRect privateIvar4;
}

- (instancetype)init {
    if (self = [super init]) {
        privateIvar1 = @"secret";
        privateIvar2 = 1.05f;
        privateIvar3 = @{@"key": @"value"};
        privateIvar4 = CGRectMake(15, 15, 20, 20);
    }
    return self;
}
@end
