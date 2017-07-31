//
//  ViewController.m
//  Model
//
//  Created by ShenYu on 2017/7/31.
//  Copyright © 2017年 ShenYu. All rights reserved.
//

#import "ViewController.h"

#import "PersonSimple.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    NSDictionary *dict = @{@"name":@"ShenYu",@"age":@"22"};
    PersonSimple *simple = [[PersonSimple alloc] init];
    simple = [simple initWithDict:dict];
    NSLog(@"name: %@, age: %@",simple.name,simple.age);
    
    
    //    NSDictionary *dict22 = @{@"name":@"ShenYu",@"age":@(12),@"isAdult":@"true"};
    NSDictionary *dict22 = @{@"name":@"ShenYu",@"age":@"12",@"isAdult":@"true"};
    
    Person *person = [[Person alloc] init];
    person = [person initWithDict:dict22];
    NSLog(@"person-name: %@, person-age: %d,person-isAdult:%d",person.name,person.age,person.isAdult);
}

@end
