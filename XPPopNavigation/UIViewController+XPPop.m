//
//  UIViewController+XPPop.m
//  XPPopNavigation
//
//  Created by coffee on 15/7/26.
//  Copyright (c) 2015年 XP. All rights reserved.
//

#import "UIViewController+XPPop.h"
#import <objc/runtime.h>

@implementation UIViewController (XPPop)

- (void)setPopDelegate:(id<XPPopControllerDelegate>)popDelegate
{
    self.navigationController.popDelegate = popDelegate;
}

- (id<XPPopControllerDelegate>)popDelegate
{
    return self.navigationController.popDelegate;
}

@end
