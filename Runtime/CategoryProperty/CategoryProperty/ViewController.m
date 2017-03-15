//
//  ViewController.m
//  CategoryProperty
//
//  Created by ShenYu on 2017/3/15.
//  Copyright © 2017年 ShenYu. All rights reserved.
//

#import "ViewController.h"
#import "GameCtrl.h"
#import "GameCtrl+MoreCommond.h"
@interface ViewController ()

@end

@implementation ViewController
// Associated Objects
// Runtime系统让Objc支持向对象动态添加变量

- (void)viewDidLoad {
    [super viewDidLoad];
    GameCtrl *ctrl = [[GameCtrl alloc] init];
    // 对象方法
    [ctrl up];
    [ctrl down];w
    
    
    // 对象分类方法
    [ctrl left];
    [ctrl right];
    
    // 为对象添加的分类属性
    ctrl.gameName = @"LOL";
    NSLog(@"%@",ctrl.gameName);
    
    ctrl.price = @"$100";
    NSLog(@"%@",ctrl.price);
    
}

@end
