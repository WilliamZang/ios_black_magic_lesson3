//
//  TestVarOrProperty.h
//  ios_black_magic_lesson3
//
//  Created by Chengwei Zang on 2017/3/31.
//  Copyright © 2017年 Chengwei Zang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TestVarOrProperty : UIView {
    @public
    int var1;
    @private
    float var2;
    NSDictionary *var3;
    __weak UIView *var4;
}

@property (nonatomic, strong) UITableView *prop1;
@property (nonatomic, readonly, weak) UIView *prop2;

@end
