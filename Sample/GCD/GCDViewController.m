//
//  GCDViewController.m
//  Sample
//
//  Created by 丁春华 on 2018/7/21.
//  Copyright © 2018年 dch. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self asyncForsync];
}

- (void)asyncForsync
{
        NSInteger result = [self methodSyncDispatchGroup];
//    NSInteger result = [self methodSyncSemaphore];
    NSLog(@"result:%ld", (long)result);
}

// 异步方法
- (void)methodAsync:(void(^)(NSInteger result))callBack
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"methodAsync 异步开始");
        sleep(2);
        NSLog(@"methodAsync 异步结束");
        if (callBack) {
            callBack(5);
        }
    });
}

// 同步方法 semaphore
- (NSInteger)methodSyncSemaphore
{
    __block NSInteger result = 0;
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    [self methodAsync:^(NSInteger value) {
        result = value;
        dispatch_semaphore_signal(sema);
    }];
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    return result;
}

// 同步方法
- (NSInteger)methodSyncDispatchGroup
{
    __block NSInteger result = 0;
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    [self methodAsync:^(NSInteger value) {
        result = value;
        dispatch_group_leave(group);
    }];
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    return result;
}

@end
