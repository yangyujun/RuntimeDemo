//
//  NSObject+Swizzling.m
//  RuntimeDemo
//
//  Created by yyj on 16/1/29.
//  Copyright © 2016年 yyj. All rights reserved.
//
#import "NSObject+Swizzling.h"

@implementation NSObject (Swizzling)

+ (void)swizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)swizzledSelector
{
    Method originalMethod = class_getInstanceMethod(class, originSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // 若已经存在，则添加会失败
    BOOL didAddMethod = class_addMethod(class,
                                        originSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    
    // 若原来的方法并不存在，则添加即可
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }

}

@end
