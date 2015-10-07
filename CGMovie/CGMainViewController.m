//
//  CGMainViewController.m
//  CGMovie
//
//  Created by stu on 11/20/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import "CGMainViewController.h"
#import "CGUSAViewController.h"
#import "CGNewsViewController.h"
#import "CGCinemaViewController.h"
#import "CGTopViewController.h"
#import "CGMoreViewController.h"
#import "CGBaseNavigationController.h"
@interface CGMainViewController ()
//加载视图控制器
-(void)loadViewControllers;
//自定义TabBar
-(void)customTabBar;
@end

@implementation CGMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 隐藏系统自带的TabBar
        self.tabBar.hidden = YES;
        
    }
    return self;
}
-(void)loadView
{
    [super loadView];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //自定义TabBar
    [self customTabBar];
    //加载子视图控制器
    [self loadViewControllers];
    
}
//自定义TabBar
-(void)customTabBar
{
    //在此处“CGMovie-Prefix.pch”进行设备高度和宽度宏定义，用来解决设备的适配显示问题
    _tabbarBG = [[UIImageView alloc]initWithFrame:CGRectMake(0, kDeficeHeight - 49, kDeficeWidth, 49)];
    //设置TabBar的背景图片
    _tabbarBG.image = [UIImage imageNamed:@"baseNavigImage"];
    _tabbarBG.userInteractionEnabled = YES;//设置以防止背景阻挡事件的传递
    [self.view addSubview:_tabbarBG];
    //设置选中项
    _selectView = [[UIImageView alloc]initWithFrame:CGRectMake(0, _tabbarBG.frame.size.height/2 - 49.0/2, 50, 49)];
    _selectView.image = [UIImage imageNamed:@"selectImage"];
    [_tabbarBG addSubview:_selectView];
    //TabBarItem背景图片
    NSArray *itemsImageName = @[@"usaImage",@"newsImage",@"topImage",@"cinemaImage",@"moreImage"];
    //相应的Item底部的提示信息
    NSArray *titles = @[@"北美",@"新闻",@"top",@"影院",@"更多"];
    NSInteger x = 64;
    //此处实现创建TabBarItem可以进行解耦合
    for (int index = 0; index < 5; index++) {
        //创建BarItem和相应的Title
        UIImageView *tabBarItem = [[UIImageView alloc]initWithFrame:CGRectMake(x/2.0 - 15, 5, 30, 30)];
        //此处是tag将对应的tabBarItem与相应的视图控制器关联？？？？？？？
        tabBarItem.tag = index;
        
        tabBarItem.contentMode = UIViewContentModeScaleToFill;
        tabBarItem.image = [UIImage imageNamed:itemsImageName[index]];
        tabBarItem.userInteractionEnabled = YES;
        [_tabbarBG addSubview:tabBarItem];
        
        //创建Title
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(x/2.0 - 15, 35, 30, 10)];
        title.text = titles[index];
        //此处设置文本居中
        title.textAlignment = NSTextAlignmentCenter;
        //title.backgroundColor = [UIColor clearColor];
        
        title.textColor = [UIColor whiteColor];
        //设置字体大小
        title.font = [UIFont systemFontOfSize:10];
        //[title setFont:[UIFont systemFontOfSize:10]];
        [_tabbarBG addSubview:title];
        x += 128;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(test:)];
        [tabBarItem addGestureRecognizer:tap];
    }
}
-(void)test:(UITapGestureRecognizer *)tap
{
    //此处用于实现_selectView移动的效果
    UIView *view =[tap view];
    //设置切换的动画效果
    [UIView beginAnimations:nil context:NULL];
    _selectView.frame = CGRectMake(0 + 67 *view.tag, _tabbarBG.frame.size.height/2 - 49.0/2, 50, 49);
    [UIView commitAnimations];
    //通过相应视图的tag值来实现视图控制器的切换
    self.selectedIndex = view.tag;
}
//加载子视图控制器
-(void)loadViewControllers
{
    //1.北美TabBarItem
    CGUSAViewController *usaVC = [[CGUSAViewController alloc]initWithNibName:@"CGUSAViewController" bundle:nil];
    CGBaseNavigationController *usaNavigC = [[CGBaseNavigationController alloc]initWithRootViewController:usaVC];
    //2.News TabBarItem
    CGNewsViewController *newsVC = [[CGNewsViewController alloc]initWithNibName:@"CGNewsViewController" bundle:nil];
    CGBaseNavigationController *newsNavigC = [[CGBaseNavigationController alloc]initWithRootViewController:newsVC];
    //3.Top TabBarItem
    CGTopViewController *topVC = [[CGTopViewController alloc]initWithNibName:@"CGTopViewController" bundle:nil];
    CGBaseNavigationController *topNavigC = [[CGBaseNavigationController alloc]initWithRootViewController:topVC];
    //4.Cinema TabBarItem
    CGCinemaViewController *cinemaVC = [[CGCinemaViewController alloc]initWithNibName:@"CGCinemaViewController" bundle:nil];
    CGBaseNavigationController *cinemaNavigC = [[CGBaseNavigationController alloc]initWithRootViewController:cinemaVC];
    
    //5.More TabBarItem
    CGMoreViewController *moreVC = [[CGMoreViewController alloc]initWithNibName:@"CGMoreViewController" bundle:nil];
    CGBaseNavigationController *moreNavigC = [[CGBaseNavigationController alloc]initWithRootViewController:moreVC];
    
    NSArray *viewControllers = @[usaNavigC,newsNavigC,topNavigC,cinemaNavigC,moreNavigC];
    
    //设置TabBarController
    [self setViewControllers:viewControllers animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
