//
//  ViewController.m
//  FlipView
//
//  Created by Reid Weber on 11/16/17.
//  Copyright © 2017 Reid Weber. All rights reserved.
//

#import "ViewController.h"
#import "MSFlipView.h"

NSInteger const kViewHeight = 200;
NSInteger const kViewWidth = 200;

@interface ViewController ()

@property (strong, nonatomic) MSFlipView *flipView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setUpFlipView];
}

- (void)setUpFlipView
{
    UIView *testViewOne = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *testViewTwo = [[UIView alloc] initWithFrame:CGRectZero];
    CGSize size = self.view.frame.size;
    CGRect frame = CGRectMake(size.width/2 - (kViewWidth/2), size.height/2 - (kViewHeight/2), kViewWidth, kViewHeight);
    self.flipView = [MSFlipView flipViewWithFrame:frame firstView:testViewOne secondView:testViewTwo];
    [self.flipView createSubviewContraints];
    [self.view addSubview:self.flipView];
    [self.view setNeedsLayout];
}

- (IBAction)flipButtonPressed:(id)sender
{
    [self.flipView flip];
}

@end
