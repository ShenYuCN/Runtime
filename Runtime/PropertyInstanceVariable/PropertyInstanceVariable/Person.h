//
//  Person.h
//  PropertyInstanceVariable
//
//  Created by ShenYu on 2017/7/17.
//  Copyright © 2017年 ShenYu. All rights reserved.
//
#import "SYModel.h"
#import <Foundation/Foundation.h>
@interface Person : SYModel{

    NSString *address;
}

@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) int age;
@property (nonatomic,assign) BOOL isAdult;
@end
