//
//  ViewController.m
//  54-重力感应
//
//  Created by 于 传峰 on 15/9/25.
//  Copyright (c) 2015年 于 传峰. All rights reserved.
//

#import "ViewController.h"
#import "CFBallView.h"
#import "CFBallTool.h"
#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]
@interface ViewController ()<UICollisionBehaviorDelegate, UIDynamicAnimatorDelegate>
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *ballView;
@property(nonatomic, strong) NSTimer* timer;
@end


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(fireBallView) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
//    [self.timer fire];
}


- (void)fireBallView
{
    BOOL left =  arc4random() % 2;
    CGFloat velocithX = left ? 500 : -500;
    
    CGFloat x = left ? 0 : self.backView.bounds.size.width - 40;
    CGFloat y = arc4random() % 100 + 20;
    
    CFBallView* ballView = [[CFBallView alloc] init];
    ballView.backgroundColor = kRandomColor;
    [self.backView addSubview:ballView];
    ballView.frame = CGRectMake( x, y, 40, 40);
    ballView.layer.cornerRadius = 20;
    ballView.clipsToBounds = YES;
    
    CFBallTool* tool = [CFBallTool sharedBallTool];
    tool.backView = self.backView;
    [tool fireWithItem:ballView linearVelocity:CGPointMake(velocithX, 0)];
    
//    [ballView fire];
    
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self fireBallView];
//    [self.timer invalidate];
//    CFBallTool* tool = [CFBallTool sharedBallTool];
//    [tool stop];
}



@end
