//
//  RetainCountViewController.m
//  Sample
//
//  Created by dch on 2018/7/16.
//  Copyright © 2018年 dch. All rights reserved.
//

#import "RetainCountViewController.h"
#import "TestModel.h"
#import "WeakObject.h"

@interface RetainCountViewController ()

@end

@implementation RetainCountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"集合对象弱引用强引用";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self testMutableArray];
//    [self testWeakObject];
//    [self testHashTable];
//    [self testMapTable];
//    [self testPointerArray];
}

- (void)testMutableArray
{
    TestModel *model = [[TestModel alloc] init];
    NSLog(@"添加集合前:%ld", (long)CFGetRetainCount((__bridge CFTypeRef)model));
    NSLog(@"%@", model);
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:model];
    
    NSLog(@"添加集合后:%ld", (long)CFGetRetainCount((__bridge CFTypeRef)model));
    NSLog(@"%@", array);
}

- (void)testWeakObject
{
    TestModel *model = [[TestModel alloc] init];
    NSLog(@"添加集合前:%ld", (long)CFGetRetainCount((__bridge CFTypeRef)model));
    
    WeakObject *wo = [[WeakObject alloc] init];
    wo.value = model;
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:wo];
    
    NSLog(@"添加集合后:%ld", (long)CFGetRetainCount((__bridge CFTypeRef)model));
}

- (void)testHashTable
{
    TestModel *model = [[TestModel alloc] init];
    NSLog(@"添加集合前:%ld", (long)CFGetRetainCount((__bridge CFTypeRef)model));
    NSLog(@"%@", model);
    
    NSHashTable *hashTable = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
    [hashTable addObject:model];
    
    NSLog(@"添加集合后:%ld", (long)CFGetRetainCount((__bridge CFTypeRef)model));
    NSLog(@"%@", hashTable);
}

- (void)testMapTable
{
    TestModel *model = [[TestModel alloc] init];
    NSLog(@"添加集合前:%ld", (long)CFGetRetainCount((__bridge CFTypeRef)model));
    NSLog(@"%@", model);
    
    NSMapTable *mapTable = [NSMapTable weakToWeakObjectsMapTable];
    [mapTable setObject:model forKey:@"test"];
    
    NSLog(@"添加集合后:%ld", (long)CFGetRetainCount((__bridge CFTypeRef)model));
    NSLog(@"%@", mapTable);
}

- (void)testPointerArray
{
    TestModel *model = [[TestModel alloc] init];
    NSLog(@"添加集合前:%ld", (long)CFGetRetainCount((__bridge CFTypeRef)model));
    NSLog(@"%@", model);
    
    NSPointerArray *pointerArray = [NSPointerArray weakObjectsPointerArray];
    [pointerArray addPointer:(__bridge void * _Nullable)(model)];
    
    NSLog(@"添加集合后:%ld", (long)CFGetRetainCount((__bridge CFTypeRef)model));
    NSLog(@"%@", pointerArray);
}

- (void)dealloc
{
    NSLog(@"RetainCountViewController dealloc ...");
}

@end
