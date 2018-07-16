//
//  TestModel.m
//  Sample
//
//  Created by dch on 2018/7/16.
//  Copyright © 2018年 dch. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

- (id)copyWithZone:(NSZone *)zone
{
    TestModel *t = [[TestModel alloc] init];
    return t;
}

@end
