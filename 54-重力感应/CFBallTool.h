//
//  CFBallTool.h
//  54-重力感应
//
//  Created by 于 传峰 on 15/9/25.
//  Copyright (c) 2015年 于 传峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface CFBallTool : NSObject

SingletonH(BallTool)
- (void)fireWithItem:(UIView *)item linearVelocity:(CGPoint)velocity;
- (void)stop;
@property(nonatomic, weak) UIView* backView;
@end
