//
//  ViewController.m
//  SwizzlingMethod
//
//  Created by ShenYu on 2017/3/15.
//  Copyright © 2017年 ShenYu. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"%s",__FUNCTION__);

    self.view.backgroundColor = [UIColor grayColor];
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self presentViewController:[[TestViewController alloc] init] animated:YES completion:nil];
}
@end
