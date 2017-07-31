//
//  GameCtrl+MoreCommond.m
//  CategoryProperty
//
//  Created by ShenYu on 2017/3/15.
//  Copyright © 2017年 ShenYu. All rights reserved.
//

#import "GameCtrl+MoreCommond.h"
#import <objc/runtime.h>
@implementation GameCtrl (MoreCommond)
- (void)left{
    NSLog(@"category--left");
}

- (void)right{
    NSLog(@"category--right");
}

/*************************** 方案一   *******************/
- (NSString *)gameName{
    // 这些方法以键值对的形式动态地向对象添加、获取或删除关联值
    // objc_getAssociatedObject(<#id object#>, <#const void *key#>)
    // Associated Objects的key要求是唯一并且是常量，而SEL是满足这个要求的，所以上面的采用隐藏参数_cmd作为key
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setGameName:(NSString *)gameName{

    objc_setAssociatedObject(self, @selector(gameName), gameName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/*************************** 方案二   *******************/

NSString * const _recognizerPrice = @"_recognizerPrice";

- (NSString *)price{
    return objc_getAssociatedObject(self, (__bridge const void *)(_recognizerPrice));
}
- (void)setPrice:(NSString *)price{
    objc_setAssociatedObject(self, (__bridge const void *)(_recognizerPrice), price, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



/*************************** 方案三   *******************/


char companyKey;

- (NSString *)company{
    return objc_getAssociatedObject(self, &companyKey);
}


- (void)setCompany:(NSString *)company{
    objc_setAssociatedObject(self,  &companyKey, company, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
