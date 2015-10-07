//
//  CGMoreViewController.m
//  CGMovie
//
//  Created by stu on 11/20/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import "CGMoreViewController.h"

@interface CGMoreViewController ()

@end

@implementation CGMoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"More";
        UITabBarItem *moreTabBar = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMore tag:4];
        self.tabBarItem = moreTabBar;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
