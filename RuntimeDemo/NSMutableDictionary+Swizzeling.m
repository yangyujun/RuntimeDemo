
//
//  NSMutableDictionary+Swizzeling.m
//  RuntimeDemo
//
//  Created by yyj on 16/1/29.
//  Copyright © 2016年 yyj. All rights reserved.
//

#import "NSMutableDictionary+Swizzeling.h"

@implementation NSMutableDictionary (Swizzeling)

+ (void)load
{
    [self swizzleInstanceMethod:NSClassFromString(@"__NSDictionaryM") originSelector:@selector(setObject:forKey:) otherSelector:@selector(hy_setObject:forKey:)];
    [self swizzleInstanceMethod:NSClassFromString(@"__NSDictionaryM") originSelector:@selector(objectForKey:) otherSelector:@selector(hy_objectForKey:)];
    [self swizzleInstanceMethod:NSClassFromString(@"__NSDictionaryM") originSelector:@selector(removeObjectForKey:) otherSelector:@selector(hy_removeObjectForKey:)];
}

- (void)hy_setObject:(id)anObject forKey:(id)aKey
{
    if (anObject != nil&&aKey != nil) {
        [self hy_setObject:anObject forKey:aKey];
    }
}

- (id)hy_objectForKey:(id)aKey
{
    if (aKey != nil) {
        return [self hy_objectForKey:aKey];
    } else {
        return nil;
    }
}

- (void)hy_removeObjectForKey:(id)aKey
{
    if (aKey != nil) {
        [self hy_removeObjectForKey:aKey];
    }
}


@end
