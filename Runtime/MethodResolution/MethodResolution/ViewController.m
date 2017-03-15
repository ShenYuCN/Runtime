//
//  ViewController.m
//  MethodResolution
//
//  Created by ShenYu on 2017/2/28.
//  Copyright © 2017年 ShenYu. All rights reserved.
//


#import "ViewController.h"
#import "Message.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Message *msg = [[Message alloc] init];
    [msg sendMessage:@"ha ha"];
}

@end
