//
//  NSMutableArray+Swizzling.m
//  RuntimeDemo
//
//  Created by yyj on 16/1/29.
//  Copyright © 2016年 yyj. All rights reserved.
//

#import "NSMutableArray+Swizzling.h"


@implementation NSMutableArray (Swizzling)

+ (void)load
{
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(addObject:) otherSelector:@selector(hy_addObject:)];
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(objectAtIndex:) otherSelector:@selector(hy_objectAtIndex:)];
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(removeObject:) otherSelector:@selector(hy_removeObject:)];
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(removeObjectAtIndex:) otherSelector:@selector(hy_removeObjectAtIndex:)];
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayM") originSelector:@selector(insertObject:atIndex:) otherSelector:@selector(hy_insertObject:atIndex:)];
}

- (void)hy_addObject:(id)object
{
    if (object != nil) {
        [self hy_addObject:object];
    }
}

- (id)hy_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self hy_objectAtIndex:index];
    } else {
        return nil;
    }
}

- (void)hy_removeObject:(id)object
{
    if (object != nil) {
        [self hy_removeObject:object];
    }
}

- (void)hy_removeObjectAtIndex:(NSUInteger)index
{
    if (self.count <= 0) {
        return;
    }
    if (index >= self.count) {
        return;
    }else{
        [self hy_removeObjectAtIndex:index];
    }
}

- (void)hy_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject == nil) {
      
    } else if (index > self.count) {
      
    } else {
        [self hy_insertObject:anObject atIndex:index];
    }
}

@end
