//
//  MSFlipView.m
//  FlipView
//
//  Created by Reid Weber on 11/16/17.
//  Copyright © 2017 Reid Weber. All rights reserved.
//

#import "MSFlipView.h"

@interface MSFlipView()

@property (strong, nonatomic) UIView *firstView;
@property (strong, nonatomic) UIView *secondView;

@property (weak, nonatomic) UIView *activeView;

@end

@implementation MSFlipView

+ (instancetype)flipViewWithFrame:(CGRect)frame firstView:(UIView *)firstView secondView:(UIView *)secondView
{
    return [[self alloc] initWithFrame:frame firstView:firstView secondView:secondView];
}

- (instancetype)initWithFrame:(CGRect)frame firstView:(UIView *)firstView secondView:(UIView *)secondView
{
    self = [super initWithFrame:frame];
    if (self) {
        _firstView = firstView;
        _secondView = secondView;
        
        _activeView = firstView;
    }
    return self;
}

- (void)createSubviewContraints
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.firstView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.firstView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.firstView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.firstView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.secondView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.secondView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.secondView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.secondView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
}

- (void)flip
{
    [CATransaction begin];
    CABasicAnimation *rotationAnimation;
    
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: 1.0 * 0.5];
    rotationAnimation.duration = 0.5;
    rotationAnimation.cumulative = true;
    rotationAnimation.repeatCount = 1.0;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut];
    
    CABasicAnimation *backgroundColorAnimation;
    backgroundColorAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    backgroundColorAnimation.toValue = (id)[UIColor blueColor].CGColor;
    
    [self.firstView.layer addAnimation: rotationAnimation forKey:@"rotationAnimation"];
    [self.secondView.layer addAnimation: rotationAnimation forKey:@"rotationAnimation"];
    
    [CATransaction commit];
}

@end
