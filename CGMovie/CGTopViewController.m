//
//  CGTopViewController.m
//  CGMovie
//
//  Created by stu on 11/20/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import "CGTopViewController.h"

@interface CGTopViewController ()

@end

@implementation CGTopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Top100";
        UIImage *topImage = [UIImage imageNamed:@"topImage.jpg"];
        UITabBarItem *topTabBar = [[UITabBarItem alloc]initWithTitle:@"Top100" image:topImage tag:3];
        self.tabBarItem = topTabBar;
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
