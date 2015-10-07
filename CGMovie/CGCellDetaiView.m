//
//  CGCellDetaiView.m
//  CGMovie
//
//  Created by stu on 12/1/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import "CGCellDetaiView.h"
#import "CGRatingView.h"
@interface CGCellDetaiView ()

@end

@implementation CGCellDetaiView
@synthesize _movieModal;
#pragma mark - loadView
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViewData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - initView
-(void)initViewData
{
    
    NSDictionary *dicSubject = self._movieModal.subject;
    //影片标题
    NSString *title = [dicSubject objectForKey:@"title"];
    NSString *original_title = [dicSubject objectForKey:@"original_title"];
    NSString *year = [dicSubject objectForKey:@"year"];
    NSString *movieInfo = [NSString stringWithFormat:@"%@ (%@)",title,year];
    self.movieNameLable.text = movieInfo;//中文标题
    self.movieNameLable.font = [UIFont boldSystemFontOfSize:25];
    self.originalTitleLabel.text = original_title;//英文标题
    self.originalTitleLabel.font = [UIFont boldSystemFontOfSize:18];
    
    //图片
     self.imgView.image = [UIImage imageWithData:[self getAndSaveNetworkData:dicSubject]];
    
    //星级和评分
    _ratingView = [[CGRatingView alloc]initWithFrame:CGRectMake(200, 70, 110, 30)];
    _ratingView.style = kSmallStyle;
    //  获取评分
    CGFloat fRating = [[[dicSubject objectForKey:@"rating"]objectForKey:@"average"] floatValue];
    _ratingView.rating = fRating;
    //  获取星级
    CGFloat fStars = [[[dicSubject objectForKey:@"rating"]objectForKey:@"stars"] floatValue];
    _ratingView.stars = fStars;
    [self.view addSubview:_ratingView];
    
    //Test  "alyt"
    
}
- (IBAction)alertView:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"土豪你好。。。" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}
//此处用于获取网络数据并将缓存相应数据
-(NSData *)getAndSaveNetworkData:(NSDictionary *)dicCell
{
    NSString *strRowNo = [NSString stringWithFormat:@"%ldla",self.rowNo];
    //此处用于实现将网络数据缓存到本地
    if ([self.localImgData objectForKey:strRowNo]== nil) {
        NSString *imgURL = [[dicCell objectForKey:@"images"]objectForKey:@"large"];
        //这种数据请求不合理(是同步请求，应该使用异步数据请求以防卡顿)，容易卡顿,一般使用第三方图片加载框架
        //此处对图片进行一个缓存处理，保存到本地
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
        [self.localImgData setObject:data forKey:strRowNo];
    }
    return  [self.localImgData objectForKey:strRowNo];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
