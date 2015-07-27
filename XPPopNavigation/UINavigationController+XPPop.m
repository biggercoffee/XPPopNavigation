//
//  UINavigationController+XPPop.m
//  XPPopNavigation
//
//  Created by coffee on 15/7/26.
//  Copyright (c) 2015年 XP. All rights reserved.
//

#import "UINavigationController+XPPop.h"
#import <objc/runtime.h>

@interface UINavigationController () <UIGestureRecognizerDelegate>
{
    
}

@end

static const char *POPDELEGATEKEY = "<-XPPOPDELEGATEKEY->";
@implementation UINavigationController (XPPop)

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //获取到系统的手势并禁用
    UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
    gesture.enabled = NO;
    
    //获取系统手势的target
    NSMutableArray *targets = [gesture valueForKey:@"_targets"];
    id targetFirstObj = [targets firstObject];
    id targetObj = [targetFirstObj valueForKey:@"target"];
    
    //设置滑动手势的target和action,采用IOS自带的target和action只是把原有的手势换成滑动手势而已
    UIPanGestureRecognizer *popGesture = [[UIPanGestureRecognizer alloc] initWithTarget:targetObj action:NSSelectorFromString(@"handleNavigationTransition:")];
    popGesture.delegate = self;
    [gesture.view addGestureRecognizer:popGesture];
    
}

- (void)setPopDelegate:(id)popDelegate
{
    objc_setAssociatedObject(self.visibleViewController, POPDELEGATEKEY, popDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id)popDelegate
{
    return objc_getAssociatedObject(self.visibleViewController, POPDELEGATEKEY);
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.viewControllers.count > 1;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([self.popDelegate respondsToSelector:@selector(xpPopGestureTouchView:)]) {
        return [self.popDelegate xpPopGestureTouchView:touch.view];
    }
    
    return YES;
}

@end









