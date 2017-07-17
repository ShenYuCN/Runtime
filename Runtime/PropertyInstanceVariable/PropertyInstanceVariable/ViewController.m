//
//  ViewController.m
//  PropertyInstanceVariable
//
//  Created by ShenYu on 2017/7/17.
//  Copyright © 2017年 ShenYu. All rights reserved.
//
#import "Person.h"
#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"runtime";
    self.view.backgroundColor = [UIColor grayColor];
    
    /*
     
     Ivar: 实例变量类型，是一个指向objc_ivar结构体的指针
     typedef struct objc_ivar *Ivar;
     
     
     // 获取所有成员变量
     class_copyIvarList
     
     // 获取成员变量名
     ivar_getName
     
     // 获取成员变量类型编码
     ivar_getTypeEncoding
     
     // 获取指定名称的成员变量
     class_getInstanceVariable
     
     // 获取某个对象成员变量的值
     object_getIvar
     
     / 设置某个对象成员变量的值
     object_setIvar
     
     */
    
    
    [self getAllIvarList];
}

- (void)getAllIvarList{
    unsigned int count = 0;
    Ivar *ivars =  class_copyIvarList([Person class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"Person拥有的成员变量的类型为%s，名字为 %s ",type, name);
    }
    
    const char *className = class_getName([Person class]);
    NSLog(@"class_getName: %s",className);

    free(ivars);
    
}

@end
