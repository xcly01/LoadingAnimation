//
//  LoadingView1.m
//  LoadingAnimation
//
//  Created by liyang on 16/7/12.
//  Copyright © 2016年 ly. All rights reserved.
//

#import "LoadingView1.h"

#define AnimationDuration 0.5f

@implementation LoadingView1

-(void)layoutSubviews
{
    [self animation];
}

- (void)animation
{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.bounds = CGRectMake(0, 0, 100, 100);
    replicatorLayer.cornerRadius = 10.0;
    replicatorLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    
    CGFloat count = 9.0;
    replicatorLayer.instanceCount = count;
    replicatorLayer.instanceDelay = AnimationDuration/count;
    CGFloat angel = 2 * M_PI/count;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angel, 0, 0, 1);
    
    replicatorLayer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.2].CGColor;
    [self.layer addSublayer:replicatorLayer];
    
    CALayer *dotLayer = [CALayer layer];
    dotLayer.bounds = CGRectMake(0, 0, 15, 15);
    dotLayer.position = CGPointMake(15, replicatorLayer.frame.size.height/2);
    dotLayer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.6].CGColor;
    dotLayer.cornerRadius = 7.0;
    
    [replicatorLayer addSublayer:dotLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration    = AnimationDuration;
    animation.fromValue   = @1;
    animation.toValue     = @0;
    animation.repeatCount = MAXFLOAT;
    [dotLayer addAnimation:animation forKey:nil];
    
}

@end
