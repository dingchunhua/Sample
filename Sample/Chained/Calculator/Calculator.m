//
//  Calculator.m
//  Sample
//
//  Created by dch on 2018/7/16.
//  Copyright © 2018年 dch. All rights reserved.
//

#import "Calculator.h"
#import "CalculateOperate.h"

@interface Calculator ()

@property (nonatomic, strong) NSMutableArray *calculateOperates;
@property (nonatomic, assign) CGFloat result;

@end

@implementation Calculator

- (Calculator *(^)(CGFloat))addition
{
    return ^id(CGFloat attribute) {
        CalculateOperate *operate = [[CalculateOperate alloc] initWith:attribute operateType:CalculateOperateTypeAddition];
        [self.calculateOperates addObject:operate];
        return self;
    };
}

- (Calculator *(^)(CGFloat))subtract
{
    return ^id(CGFloat attribute) {
        CalculateOperate *operate = [[CalculateOperate alloc] initWith:attribute operateType:CalculateOperateTypeSubtract];
        [self.calculateOperates addObject:operate];
        return self;
    };
}

- (Calculator *(^)(CGFloat))multiply
{
    return ^id(CGFloat attribute) {
        CalculateOperate *operate = [[CalculateOperate alloc] initWith:attribute operateType:CalculateOperateTypeMultiply];
        [self.calculateOperates addObject:operate];
        return self;
    };
}

- (Calculator *(^)(CGFloat))division
{
    return ^id(CGFloat attribute) {
        CalculateOperate *operate = [[CalculateOperate alloc] initWith:attribute operateType:CalculateOperateTypeDivision];
        [self.calculateOperates addObject:operate];
        return self;
    };
}

- (CGFloat)calculate
{
    if (_calculateOperates == nil) {
        return 0;
    }
    
    for (CalculateOperate *operate in _calculateOperates) {
        CGFloat number = operate.num;
        CalculateOperateType operateType = operate.operateType;
        
        if (operateType == CalculateOperateTypeAddition) {
            _result = _result + number;
        }
        
        if (operateType == CalculateOperateTypeSubtract) {
            _result = _result - number;
        }
        
        if (operateType == CalculateOperateTypeMultiply) {
            _result = _result * number;
        }
        
        if (operateType == CalculateOperateTypeDivision) {
            _result = _result / number;
        }
    }
    
    return _result;
}

- (NSMutableArray *)calculateOperates
{
    if (_calculateOperates == nil) {
        _calculateOperates = NSMutableArray.alloc.init;
    }
    return _calculateOperates;
}

@end
