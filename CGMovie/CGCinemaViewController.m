//
//  CGCinemaViewController.m
//  CGMovie
//
//  Created by stu on 11/20/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import "CGCinemaViewController.h"

@interface CGCinemaViewController ()

@end

@implementation CGCinemaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Cinema";
        UIImage *cinemaImage = [UIImage imageNamed:@"cinemaImage"];
        UITabBarItem *cinemaTabBar = [[UITabBarItem alloc]initWithTitle:@"Cinema" image:cinemaImage tag:2];
        self.tabBarItem = cinemaTabBar;
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
