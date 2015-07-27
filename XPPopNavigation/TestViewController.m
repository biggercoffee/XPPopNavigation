//
//  TestViewController.m
//  XPPopNavigation
//
//  Created by coffee on 15/7/26.
//  Copyright (c) 2015年 XP. All rights reserved.
//

#import "TestViewController.h"
#import "XPPopHeaders.h"

@interface TestViewController () <XPPopControllerDelegate>
{
    UIView *_grayView;
}

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"test";
    
    UIView *grayView = [UIView new];
    grayView.backgroundColor = [UIColor grayColor];
    grayView.frame = CGRectMake(0, 0, 100, 100);
    [self.view addSubview:grayView];
    _grayView = grayView;
    
    self.popDelegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)xpPopGestureTouchView:(UIView *)view
{
    
    if (view == _grayView) {
        return NO;
    }
    
    return YES;
}

@end
