//
//  ViewController.m
//  RuntimeDemo
//
//  Created by yyj on 16/1/29.
//  Copyright © 2016年 yyj. All rights reserved.
//

#import "ViewController.h"
#import "Cat.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //1. Method Swizzle   数组，字典添加对象为空，取值越界
    NSArray *array = @[@"a",@"b"];
    NSLog(@" array %@",array[4]);
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc]initWithObjects:@"a",@"b", nil];
    [mutableArray addObject:nil];
    [mutableArray removeObject:@"c"];
    [mutableArray removeObjectAtIndex:4];
    [mutableArray insertObject:nil atIndex:4];
    [mutableArray insertObject:@"c" atIndex:5];
    NSLog(@" mutableArray %@",array[4]);
    
    NSDictionary *dict = @{@"a":@"1",@"b":@"2"};
    NSLog(@" dict  %@",dict[@"c"]);
    
    NSMutableDictionary *mutableDict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"a",@"1",@"b",@"2", nil];
    [mutableDict setObject:nil forKey:@"d"];
    [mutableDict setObject:@"3" forKey:nil];
    [mutableDict removeObjectForKey:nil];
    NSLog(@" mutableDict  %@",mutableDict[@"c"]);

    [Cat test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
