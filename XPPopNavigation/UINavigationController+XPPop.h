//
//  UINavigationController+XPPop.h
//  XPPopNavigation
//
//  Created by coffee on 15/7/26.
//  Copyright (c) 2015年 XP. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XPPopControllerDelegate <NSObject>
@optional
- (BOOL)xpPopGestureTouchView:(UIView *)view;
@end

@interface UINavigationController (XPPop)

/**
 *  pop delegate
 */
@property (assign,nonatomic) id<XPPopControllerDelegate> popDelegate;

@end
