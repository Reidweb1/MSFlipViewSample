//
//  MSFlipView.h
//  FlipView
//
//  Created by Reid Weber on 11/16/17.
//  Copyright © 2017 Reid Weber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSFlipView : UIView

+ (instancetype)flipViewWithFrame:(CGRect)frame firstView:(UIView *)firstView secondView:(UIView *)secondView;
- (void)createSubviewContraints;
- (void)flip;

@end
