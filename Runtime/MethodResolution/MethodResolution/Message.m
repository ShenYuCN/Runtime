//
//  Message.m
//  Fastforward
//
//  Created by ShenYu on 2017/2/28.
//  Copyright © 2017年 ShenYu. All rights reserved.
//

#import "Message.h"
#import <objc/runtime.h>
@implementation Message

// 需要注释此处，当 Runtime 系统在Cache和方法分发表中（包括超类）找不到要执行的方法时，Runtime会调用resolveInstanceMethod:或resolveClassMethod:来给程序员一次动态添加方法实现的机会

//- (void)sendMessage:(NSString *)msg{
//    NSLog(@"original method:send message:%@",msg);
//}


#pragma mark - Method Resolution  动态方法解析
/* override resolveInstanceMethod or resolveClassMethod for changing sendMessage method implementation */
+ (BOOL)resolveInstanceMethod:(SEL)sel{

    if (sel == @selector(sendMessage:)) {
        class_addMethod([self class], sel, imp_implementationWithBlock(^(id self,NSString *str){
            NSLog(@"resolution_way: send message:%@",str);
        }), "v@*");
    }
    return YES;
}

@end
