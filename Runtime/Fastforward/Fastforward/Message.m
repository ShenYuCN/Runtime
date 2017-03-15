//
//  Message.m
//  Fastforward
//
//  Created by ShenYu on 2017/2/28.
//  Copyright © 2017年 ShenYu. All rights reserved.
//

#import "Message.h"
#import <objc/runtime.h>
#import "MessageFastForwarding.h"
@implementation Message
//- (void)sendMessage:(NSString *)msg{
//    NSLog(@"original method:send message:%@",msg);
//}

#pragma mark - Fast Forwarding   重定向
// 这里叫Fast，是因为这一步不会创建NSInvocation对象，但Normal Forwarding会创建它，所以相对于更快点。
- (id)forwardingTargetForSelector:(SEL)aSelector{

    if (aSelector == @selector(sendMessage:)) {
        return [MessageFastForwarding new];
    }
    
    return  [super forwardingTargetForSelector:aSelector];
}
@end
