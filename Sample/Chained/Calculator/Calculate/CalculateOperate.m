//
//  CalculateOperate.m
//  Sample
//
//  Created by dch on 2018/7/16.
//  Copyright © 2018年 dch. All rights reserved.
//

#import "CalculateOperate.h"

@implementation CalculateOperate

- (instancetype)initWith:(CGFloat)num operateType:(CalculateOperateType)operateType
{
    _num = num;
    _operateType = operateType;
    return self;
}

@end
