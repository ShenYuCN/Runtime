//
//  ViewController.m
//  KVO
//
//  Created by ShenYu on 2018/10/23.
//  Copyright © 2018 ShenYu. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Student *_obj = [[Student alloc] init];
    NSLog(@"class-withOutKVO: %@ \n",object_getClass(_obj));
    NSLog(@"setterAdress-withOutKVO: %p \n",[_obj methodForSelector:@selector(setAName:)]);
    [_obj addObserver:self forKeyPath:@"AName" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:(__bridge void *)(self)];
    
    NSLog(@"class-addKVO: %@ \n",object_getClass(_obj));
    NSLog(@"setterAdress-addKVO: %p \n", [_obj methodForSelector:@selector(setAName:)]);
    
    
    [_obj removeObserver:self forKeyPath:@"AName"];
    NSLog(@"class-removeKVO: %@", object_getClass(_obj));
    NSLog(@"setterAdress-removeKVO: %p \n",[_obj methodForSelector:@selector(setAName:)]);
    
    
//    2018-10-23 17:42:08.607137+0800 KVO[52550:735047] class-withOutKVO: Student
//    2018-10-23 17:42:08.607317+0800 KVO[52550:735047] setterAdress-withOutKVO: 0x101793870
//    2018-10-23 17:42:08.607840+0800 KVO[52550:735047] class-addKVO: NSKVONotifying_Student
//    2018-10-23 17:42:08.607947+0800 KVO[52550:735047] setterAdress-addKVO: 0x101ad5a7a
//    2018-10-23 17:42:08.608089+0800 KVO[52550:735047] class-removeKVO: Student
//    2018-10-23 17:42:08.608213+0800 KVO[52550:735047] setterAdress-removeKVO: 0x101793870
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
