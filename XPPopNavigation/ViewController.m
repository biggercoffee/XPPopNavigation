//
//  ViewController.m
//  XPPopNavigation
//
//  Created by coffee on 15/7/26.
//  Copyright (c) 2015年 XP. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"home";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushTestVC:(id)sender {
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
}

@end
