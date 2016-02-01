//
//  NSObject+Swizzling.h
//  RuntimeDemo
//
//  Created by yyj on 16/1/29.
//  Copyright © 2016年 yyj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)
+ (void)swizzleInstanceMethod:(Class)class originSelector:(SEL)originSelector otherSelector:(SEL)swizzledSelector;
@end
