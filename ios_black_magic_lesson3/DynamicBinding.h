//
//  DynamicBinding.h
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/3/31.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCSomeClassA : NSObject

- (void)func1;
@end

@interface OCSomeClassB : NSObject

- (void)func2;
@end
#ifdef __cplusplus
extern "C" {
#endif
void testOC1();
void testOC2();

#ifdef __cplusplus
}
#endif
