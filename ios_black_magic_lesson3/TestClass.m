//
//  TestClass.m
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/3/10.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#import "TestClass.h"
#import <UIKit/UIKit.h>

@implementation TestClass

- (CGRect)myRect
{
    return CGRectMake(0, 0, 0, 0);
}


- (NSInteger)testMethod
{
    return 15;
}

- (CGRect)makeCGRectWithOther:(CGRect)newCGRect
{
    return CGRectMake(self.myRect.origin.x + newCGRect.origin.x,
                      self.myRect.origin.y + newCGRect.origin.y,
                      self.myRect.size.width + newCGRect.size.width,
                      self.myRect.size.height + newCGRect.size.height);
}
@end

CGRect realMakeCGRectWithOther(TestClass *self, SEL cmd, CGRect newCGRect) {
    return CGRectMake(self.myRect.origin.x + newCGRect.origin.x,
                      self.myRect.origin.y + newCGRect.origin.y,
                      self.myRect.size.width + newCGRect.size.width,
                      self.myRect.size.height + newCGRect.size.height);
}
