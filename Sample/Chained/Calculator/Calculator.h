//
//  Calculator.h
//  Sample
//
//  Created by dch on 2018/7/16.
//  Copyright © 2018年 dch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Calculator : NSObject

- (Calculator * (^)(CGFloat num))addition;
- (Calculator * (^)(CGFloat num))subtract;
- (Calculator * (^)(CGFloat num))multiply;
- (Calculator * (^)(CGFloat num))division;

- (CGFloat)calculate;

@end
