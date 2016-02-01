//
//  NSArray+Swizzling.m
//  RuntimeDemo
//
//  Created by yyj on 16/1/29.
//  Copyright © 2016年 yyj. All rights reserved.
//

#import "NSArray+Swizzling.h"

@implementation NSArray (Swizzling)

+ (void)load
{
    [self swizzleInstanceMethod:NSClassFromString(@"__NSArrayI") originSelector:@selector(objectAtIndex:) otherSelector:@selector(hy_objectAtIndex:)];
}

- (id)hy_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self hy_objectAtIndex:index];
    } else {
        return nil;
    }
}


@end
