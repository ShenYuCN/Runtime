//
//  TestViewController+SYTracking.m
//  SwizzlingMethod
//
//  Created by ShenYu on 2018/10/9.
//  Copyright © 2018 ShenYu. All rights reserved.
//

#import "TestViewController+SYTracking.h"
#import <objc/runtime.h>

@implementation TestViewController (SYTracking)

+ (void)load
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleMethod([self class], @selector(viewDidAppear:), @selector(swizzled_viewDidAppear:));
    });
}

- (void)swizzled_viewDidAppear:(BOOL)animated
{
    NSLog(@"%s",__FUNCTION__);
    
    // call original implementation
    [self swizzled_viewDidAppear:animated];
    
}

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    // the method doesn’t exist and we just added one
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}
@end
