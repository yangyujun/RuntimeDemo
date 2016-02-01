//
//  NSDictionary+Swizzling.m
//  RuntimeDemo
//
//  Created by yyj on 16/1/29.
//  Copyright © 2016年 yyj. All rights reserved.
//

#import "NSDictionary+Swizzling.h"

@implementation NSDictionary (Swizzling)

+ (void)load
{
    [self swizzleInstanceMethod:NSClassFromString(@"__NSDictionaryI") originSelector:@selector(objectForKey:) otherSelector:@selector(hy_objectForKey:)];
}

- (id)hy_objectForKey:(NSString *)key
{
    if (key != nil) {
        return [self hy_objectForKey:key];
    } else {
        return nil;
    }
}


@end
