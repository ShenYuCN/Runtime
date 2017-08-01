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


/** 利用参数key 将对象object中存储的对应值取出来 */
- (NSString *)company{
    return objc_getAssociatedObject(self, &companyKey);
}


/**
 set方法，将值value 跟对象object 关联起来（将值value 存储到对象object 中）
 参数 object：给哪个对象设置属性
 参数 key：一个属性对应一个Key，将来可以通过key取出这个存储的值，key 可以是任何类型：double、int 等，建议用char 可以节省字节
 参数 value：给属性设置的值
 参数policy：存储策略 （assign 、copy 、 retain就是strong
 
 */

- (void)setCompany:(NSString *)company{
    objc_setAssociatedObject(self,  &companyKey, company, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
