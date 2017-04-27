//
//  MethodOverload.h
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/4/21.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Class1 : NSObject
- (void)method1:(NSString *)param1;
- (int)method2:(int)param1 with:(int)param2;
- (id)method3;
@end

@interface Class2 : Class1
- (void)method4:(NSString *)param1;
- (int)method2:(int)param1 with:(int)param2;
- (int)method2$:(int)param1 with:(int)param2;
- (id)method6;
@end
