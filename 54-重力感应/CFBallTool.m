//
//  CFBallTool.m
//  54-重力感应
//
//  Created by 于 传峰 on 15/9/25.
//  Copyright (c) 2015年 于 传峰. All rights reserved.
//

#import "CFBallTool.h"
#import <CoreMotion/CoreMotion.h>

@interface CFBallTool()

//@property(nonatomic, weak) UIView* backView;
@property(nonatomic, assign) CGPoint velocity;

@property(nonatomic, strong) CMMotionManager* motionManager;

@property(nonatomic, strong) UIDynamicAnimator* animator;
@property(nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property(nonatomic, strong) UICollisionBehavior *collisionBehavior;
@property(nonatomic, strong) UIDynamicItemBehavior *itemBehavior;

@property(nonatomic, assign) BOOL runing;
@end

@implementation CFBallTool
SingletonM(BallTool)
static NSTimeInterval marginTime = 0.1;

#pragma lazy
- (UIDynamicAnimator *)animator
{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.backView];
    }
    return _animator;
}

- (UIGravityBehavior *)gravityBehavior
{
    if (!_gravityBehavior) {
        _gravityBehavior = [[UIGravityBehavior alloc] init];
    }
    return _gravityBehavior;
}

- (UICollisionBehavior *)collisionBehavior
{
    if (!_collisionBehavior) {
        _collisionBehavior = [[UICollisionBehavior alloc] init];
        [_collisionBehavior setTranslatesReferenceBoundsIntoBoundary:YES];
        _collisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
    }
    return _collisionBehavior;
}

- (UIDynamicItemBehavior *)itemBehavior
{
    if (!_itemBehavior) {
        _itemBehavior = [[UIDynamicItemBehavior alloc] init];
        [_itemBehavior setElasticity:0.6];
        _itemBehavior.density = 10;
    }
    return _itemBehavior;
}

// 加速度
- (void)startAccelerometer
{
    self.motionManager = [[CMMotionManager alloc] init];
    
    if (self.motionManager.deviceMotionAvailable) {
        self.motionManager.deviceMotionUpdateInterval = marginTime;
        __weak typeof(self) weakSelf = self;
        [self.motionManager startDeviceMotionUpdatesToQueue:[[NSOperationQueue alloc]init] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                CMAcceleration acceleration = motion.gravity;
                CGFloat y = acceleration.y;
                if (fabs(y) < 0.15) {
                    y = -0.6;
                }
                weakSelf.gravityBehavior.gravityDirection = CGVectorMake(acceleration.x, -y);
            });
        }];
         
    }
}

- (void)addDynamicBehaviour {
    
    [self.animator addBehavior:self.gravityBehavior];
    
    [self.animator addBehavior:self.collisionBehavior];
    
    [self.animator addBehavior:self.itemBehavior];
}

- (void)fireWithItem:(UIView *)item linearVelocity:(CGPoint)velocity
{
    if (!self.runing) {
        self.runing = YES;
        [self addDynamicBehaviour];
        [self startAccelerometer];
    }
    
    [self.gravityBehavior addItem:item];
    [self.collisionBehavior addItem:item];
    [self.itemBehavior addItem:item];
    [self.itemBehavior addLinearVelocity:velocity forItem:item];

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        item.hidden = YES;
        [self.gravityBehavior removeItem:item];
        [self.collisionBehavior removeItem:item];
        [self.itemBehavior removeItem:item];
        [item removeFromSuperview];
    });
}

- (void)stop
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.motionManager stopAccelerometerUpdates];
        [self.animator removeAllBehaviors];
        self.runing = NO;
    });
}

@end
