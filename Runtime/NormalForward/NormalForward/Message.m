//
//  Message.m
//  Fastforward
//
//  Created by ShenYu on 2017/2/28.
//  Copyright © 2017年 ShenYu. All rights reserved.
//

#import "Message.h"
#import <objc/runtime.h>
#import "MessageNormalForwarding.h"
@implementation Message


//- (void)sendMessage:(NSString *)msg{
//    NSLog(@"original method:send message:%@",msg);
//}

#pragma mark - Normal Forwarding  消息转发
//Runtime系统会向对象发送methodSignatureForSelector:消息，并取到返回的方法签名用于生成NSInvocation对象。
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
    if (!methodSignature) {
        methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:*"];
    }
    return methodSignature;
}
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    MessageNormalForwarding *normalForwarding = [MessageNormalForwarding new];
    
    if ([normalForwarding respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:normalForwarding];
    }else{
        [super forwardInvocation:anInvocation];
    }
}
@end
