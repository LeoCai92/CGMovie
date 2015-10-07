//
//  CGUSAViewController.m
//  CGMovie
//
//  Created by stu on 11/20/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import "CGUSAViewController.h"
#import "CGNetworkService.h"
#import "MovieModel.h"
#import "CGUSACell.h"
#import "CGCellDetaiView.h"
@interface CGUSAViewController ()
//添加NavigationItem
-(void)loadNavigationItem;
//数据请求
-(void)requestData;
//刷新数据
-(void)refreshUI;
@end
@implementation CGUSAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"北美榜";
        //初始化本地轻量级数据库
        self.localImgData = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

#pragma mark - Action methods
-(void)loadView
{
    [super loadView];
    //设置主视图的底色，以防翻转时出现白底
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tableBackUSA"]];
    //加载海报视图
    [self loadPosterView];
    //加载UITableView
    [self loadListView];
    //加载导航控制项
    [self loadNavigationItem];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置代理
    listTableView.delegate = self;
    listTableView.dataSource = self;
    //请求“网络”（此处为本地数据）数据
    //[self requestData];
    //模拟网络数据。。。延迟一秒再获取数据
    [self performSelector:@selector(requestData) withObject:nil afterDelay:1];
}
//添加NavigationItem
-(void)loadNavigationItem
{
    UIImageView *itemBaseView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 45,35)];
    itemBaseView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"baseImage"]];
    //添加手势识别器
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeBrownserStyle)];
    [itemBaseView addGestureRecognizer:tap];
    //列表视图
    UIImage *listImage = [UIImage imageNamed:@"listIcon"];
    UIImageView *listView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7, 20, 20)];
    listView.tag = 101;
    listView.image = listImage;
    //海报视图
    UIImage *posterImage = [UIImage imageNamed:@"posterIcon"];
    UIImageView *posterView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 2, 30, 30)];
    posterView.image = posterImage;
    //海报视图默认是隐藏的
    posterView.hidden = YES;
    posterView.tag = 102;
    [itemBaseView addSubview:posterView];
    [itemBaseView addSubview:listView];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithCustomView:itemBaseView];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}
//开始视图翻转动画
-(void)startRollAnimation:(UIView *)view oneView:(UIView *)view1 anotherView:(UIView *)view2
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    if (view1.hidden) {
        view1.hidden = NO;
        view2.hidden = YES;        //设置翻转的动画效果
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:view cache:YES];
    } else {
        view1.hidden = YES;
        view2.hidden = NO;
        //设置翻转的动画效果
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:view cache:YES];
    }
    
    [UIView commitAnimations];
}
//当用户点击视图显示（列表或是海报形式来显示）按钮
-(void)changeBrownserStyle
{
    
    //获取基视图
    UIView *itemBaseView = [self.navigationItem.rightBarButtonItem customView];
    //获取基视图下的子视图
    UIView *posterView = [itemBaseView viewWithTag:101];
    UIView *listView = [itemBaseView viewWithTag:102];
    [itemBaseView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [self startRollAnimation:itemBaseView oneView:listView anotherView:posterView];
    [self startRollAnimation:self.view oneView:listTableView anotherView:posterUIView];
}
//加载列表视图
-(void)loadListView
{
    listTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kDeficeWidth, kDeficeHeight-20-44-49)style:UITableViewStylePlain];
    //    //设置单元格行高
    //    listTableView.rowHeight = 100;
//    //设置表格背景
    listTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tableBackUSA"]];
    //色孩纸滚动条的颜色
    listTableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    [self.view addSubview:listTableView];
}
//加载海报视图
-(void)loadPosterView
{
    posterUIView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeficeWidth, kDeficeHeight)];
    posterUIView.backgroundColor = [UIColor purpleColor];
    //posterUIView.hidden = YES;
    [self.view addSubview:posterUIView];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //定义静态标识符
    static NSString *cellId = @"cellId";
    //检查是否存在闲置的单元格
    CGUSACell *cell = [listTableView dequeueReusableCellWithIdentifier:cellId];
    //如果取出的表格行为Nil
    if (!cell) {
        //创建一个UITableViewCell对象，使用UITableViewCellStyleSubtitle风格
        cell = [[CGUSACell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    //设置每一个单元格的背景
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tableBackUSA"]];
//    cell.textLabel.textColor = [UIColor whiteColor];
//    cell.textLabel.text = @"test";
    //从IndexPath参数获取当前行的行号
    NSInteger rowNo = indexPath.row;
    cell._movieModel = subjectArray[rowNo];
    //初始化单元格中的本地轻量级数据库
    cell.localImgData = self.localImgData;
    cell.rowNo = rowNo;
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return subjectArray.count;
}
//单击单元格触发事件
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    CGCellDetaiView *cellDetaiView = [[CGCellDetaiView alloc]initWithNibName:@"CGCellDetaiView" bundle:nil];
    //从IndexPath参数获取当前行的行号
    NSInteger rowNo = indexPath.row;
    cellDetaiView._movieModal = subjectArray[rowNo];
    cellDetaiView.localImgData = self.localImgData;
    cellDetaiView.rowNo = rowNo;
    [cellDetaiView.view addSubview:nil];
    
    [self.navigationController pushViewController:cellDetaiView animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)refreshUI
{
    MovieModel *movieModel = subjectArray[0];
    NSLog(@"content 1: %@",[[movieModel subject]objectForKey:@"title"]);
    NSLog(@"content 2: %@",[[movieModel subject]objectForKey:@"images"]);
    NSLog(@"content 3: %@",[[movieModel subject]objectForKey:@"id"]);
    [listTableView reloadData];
}
//使用代理方法设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
//\\上面是控制界面的
///////////////////////////////////////////////////////////////////////////////
//\\下面是进行数据处理的
-(void)requestData
{
    NSArray *result = [CGNetworkService northUSAData];
    //初始化数据数组
    subjectArray = [[NSMutableArray alloc]initWithCapacity:result.count];
    //测试数据是否成功被获取
    NSLog(@"result date: %@",[[result objectAtIndex:0] objectForKey:@"box"]);
    for (id data in result) {//如何来理解？
                            //此处的Data是result相对应的原字典集合？？？
        MovieModel *movieModel = [[MovieModel alloc]init];
        movieModel.box = [data objectForKey:@"box"];
        movieModel.rank = [data objectForKey:@"rank"];
        movieModel.subject = [data objectForKey:@"subject"];
        //存放数据模型
        [subjectArray addObject:movieModel];
        //NSLog(@"%@",data);
        //NSLog(@"%@",movieModel.rank);
    }
    [self refreshUI];
}

@end
