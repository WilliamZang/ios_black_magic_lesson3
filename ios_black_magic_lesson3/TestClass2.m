//
//  TestClass2.m
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/3/31.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#import "TestClass2.h"
#import <UIKit/UIKit.h>

@implementation TestClass2

- (CGRect)myRect
{
    return CGRectMake(0, 0, 0, 0);
}

- (CGRect)makeCGRectWithOther:(CGRect)newCGRect
{
    return CGRectMake(self.myRect.origin.x + newCGRect.origin.x,
                      self.myRect.origin.y + newCGRect.origin.y,
                      self.myRect.size.width + newCGRect.size.width,
                      self.myRect.size.height + newCGRect.size.height);
}

@end

CGRect realMakeCGRectWithOther(TestClass2 *self, SEL cmd, CGRect newCGRect) {
    return CGRectMake(self.myRect.origin.x + newCGRect.origin.x,
                      self.myRect.origin.y + newCGRect.origin.y,
                      self.myRect.size.width + newCGRect.size.width,
                      self.myRect.size.height + newCGRect.size.height);
}
