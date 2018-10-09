//
//  GameCtrl+MoreCommond.h
//  CategoryProperty
//
//  Created by ShenYu on 2017/3/15.
//  Copyright © 2017年 ShenYu. All rights reserved.
//

#import "GameCtrl.h"

@interface GameCtrl (MoreCommond)
- (void)left;
- (void)right;


@property (nonatomic,strong) NSString *gameName;

@property (nonatomic,strong) NSString *price;

@property (nonatomic,strong) NSString *company;

@property (nonatomic,assign) NSUInteger mIndex;
@end
