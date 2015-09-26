//
//  CFBallView.m
//  54-重力感应
//
//  Created by 于 传峰 on 15/9/25.
//  Copyright (c) 2015年 于 传峰. All rights reserved.
//

#import "CFBallView.h"
//#import <CoreMotion/CoreMotion.h>

//@interface CFBallView()
//
//@property(nonatomic, weak) UIView* backView;
//@property(nonatomic, assign) CGPoint velocity;
//
//@property(nonatomic, strong) CMMotionManager* motionManager;
//
//@property(nonatomic, strong) UIDynamicAnimator* animator;
//@property(nonatomic, strong) UIGravityBehavior *gravityBehavior;
//@end
//
//static NSTimeInterval marginTime = 0.1;
@implementation CFBallView
//
//- (instancetype)initWithReferenceView:(UIView *)referenceView linearVelocity:(CGPoint)velocity
//{
//    self.velocity = velocity;
//    self.backView = referenceView;
//    if (self = [super initWithFrame:CGRectZero]) {
//        
//    }
//    return self;
//}
//
//// 加速度
//- (void)startAccelerometer
//{
//    self.motionManager = [[CMMotionManager alloc] init];
//    if (self.motionManager.accelerometerAvailable) {
//        self.motionManager.accelerometerUpdateInterval = marginTime;
//        __weak typeof(self) weakSelf = self;
//        [self.motionManager startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
//            
//            dispatch_async(dispatch_get_main_queue(), ^{
//                CMAcceleration acceleration = accelerometerData.acceleration;
//                
//                weakSelf.gravityBehavior.gravityDirection = CGVectorMake(acceleration.x, -acceleration.y);
//            });
//        }];
//    }
//}
//
//- (void)addDynamicBehaviour {
//    
//    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.backView];
//    
//    UIGravityBehavior * gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self]];
//    self.gravityBehavior = gravityBehavior;
//    [self.animator addBehavior:gravityBehavior];
//    
//    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self]];
//    [collisionBehavior setTranslatesReferenceBoundsIntoBoundary:YES];
//    collisionBehavior.collisionMode = UICollisionBehaviorModeEverything;
//    [self.animator addBehavior:collisionBehavior];
//    
//    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self]];
//    [itemBehavior setElasticity:0.6];
//    [itemBehavior addLinearVelocity:self.velocity forItem:self];
//    [self.animator addBehavior:itemBehavior];
//}
//
//- (void)fire
//{
//    [self addDynamicBehaviour];
//    [self startAccelerometer];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.hidden = YES;
//        [self.motionManager stopAccelerometerUpdates];
//        [self.animator removeAllBehaviors];
//        [self removeFromSuperview];
//    });
//}
//
@end
