//
//  ViewController.m
//  PropertyInstanceVariable
//
//  Created by ShenYu on 2017/7/17.
//  Copyright © 2017年 ShenYu. All rights reserved.
//
#import <objc/runtime.h>
#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"runtime";
    self.view.backgroundColor = [UIColor grayColor];
    
   
    NSDictionary * dict = @{@"name":@"jd"};
    Person *person = [[Person alloc] initWithDict:dict];
    NSLog(@"%@",person.name);
    
    // 获取所有成员变量也可以获取到.h文件{}里面的，而获取所有属性不能
    //[self getAllIvarList];
    
    //NSLog(@"---  获取所有属性   ---");
    //[self getAllProperty];
    

    

}

/** 获取所有成员变量 */
- (void)getAllIvarList{
    /*
     
     Ivar: 实例变量类型，是一个指向objc_ivar结构体的指针
     typedef struct objc_ivar *Ivar;
     
     
     // 获取所有成员变量
     class_copyIvarList
     
     // 获取成员变量名
     ivar_getName
     
     // 获取成员变量类型编码
     ivar_getTypeEncoding  (int,NSString,NSArray)
     
     // 获取指定名称的成员变量
     class_getInstanceVariable
     
     // 获取某个对象成员变量的值
     object_getIvar
     
     / 设置某个对象成员变量的值
     object_setIvar
     
     */
    
    unsigned int count = 0;
    Ivar *ivars =  class_copyIvarList([Person class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"Person成员变量的类型为%s，为 %s ",type, name);

    }
    
    const char *className = class_getName([Person class]);
    NSLog(@"class_getName: %s",className);
    
    free(ivars);
    
    /*
     Person拥有的成员变量的类型为@"NSString"，名字为 address
     Person拥有的成员变量的类型为B，名字为 _isAdult
     Person拥有的成员变量的类型为i，名字为 _age
     Person拥有的成员变量的类型为@"NSString"，名字为 _name
     
     class_getName: Person
     */
}

/** 获取所有属性 */
- (void)getAllProperty{
    
    
    /*
     1、属性的定义
     
     objc_property_t：声明的属性的类型，是一个指向objc_property结构体的指针
     typedef struct objc_property *objc_property_t;
     
     2、相关函数
     
     // 获取所有属性
     class_copyPropertyList
     说明：使用class_copyPropertyList并不会获取无@property声明的成员变量
     // 获取属性名
     property_getName
     // 获取属性特性描述字符串
     property_getAttributes
     // 获取所有属性特性
     property_copyAttributeList
     
     */
    unsigned int count = 0;
    objc_property_t *propertyList =  class_copyPropertyList([Person class], &count);
    

    for (unsigned int i = 0; i < count; i ++) {
        objc_property_t myProperty = propertyList[i];
        const char *name =  property_getName(myProperty);
        const char *attributes = property_getAttributes(myProperty);
        NSLog(@"Person属性: %s,%s",name,attributes);
    }
    
    /*
     
     Person属性: name
     Person属性: age
     Person属性: isAdult
     
     Person属性: name,T@"NSString",&,N,V_name
     Person属性: age,Ti,N,V_age
     Person属性: isAdult,TB,N,V_isAdult
     */

}




@end
