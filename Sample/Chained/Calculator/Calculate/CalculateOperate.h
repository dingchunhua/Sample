//
//  CalculateOperate.h
//  Sample
//
//  Created by dch on 2018/7/16.
//  Copyright © 2018年 dch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CalculateOperateType) {
    CalculateOperateTypeAddition = 1,
    CalculateOperateTypeSubtract = 2,
    CalculateOperateTypeMultiply = 3,
    CalculateOperateTypeDivision = 4,
};

@interface CalculateOperate : NSObject

@property (nonatomic, assign, readonly) CGFloat num;
@property (nonatomic, assign, readonly) CalculateOperateType operateType;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWith:(CGFloat)num operateType:(CalculateOperateType)operateType;

@end
