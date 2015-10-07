//
//  CGUSACell.m
//  CGMovie
//
//  Created by stu on 11/27/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import "CGUSACell.h"
#import "MovieModel.h"
#import "CGRatingView.h"

@implementation CGUSACell
@synthesize _movieModel;
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
        //添加一个详细按钮
        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    return self;
}
//初始化子视图
-(void)initSubView
{
    //图片
    _imgView =[[UIImageView alloc]initWithFrame:CGRectZero];
    _imgView.backgroundColor = [UIColor blueColor];
    //使用contentView便于图片编辑
    [self.contentView addSubview:_imgView];
    
    //标题
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectZero];
    //_titleLbl.backgroundColor = [UIColor  whiteColor]
    _titleLbl.textColor = [UIColor orangeColor];
    _titleLbl.font = [UIFont boldSystemFontOfSize:20];
    [self.contentView addSubview:_titleLbl];
    
    //年份
    _yearLbl = [[UILabel alloc]initWithFrame:CGRectZero];
   // _yearLbl.backgroundColor = [UIColor  whiteColor];
    _yearLbl.textColor = [UIColor whiteColor];
    _yearLbl.font = [UIFont boldSystemFontOfSize:16];
    [self.contentView addSubview:_yearLbl];
    
    //星级和评分
    
    _ratingView = [[CGRatingView alloc]initWithFrame:CGRectZero];
    //_ratingView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_ratingView];
    
}
- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)layoutSubviews
{
    //此处必须调用父类的排版方法，否则无法正常显示单元格
    [super layoutSubviews];
    //获取subject字典
    NSDictionary *dicCell = self._movieModel.subject;
    
    
    //图片
    _imgView.frame = CGRectMake(10, 10, 60, 100);
    
    _imgView.image = [UIImage imageWithData:[self getAndSaveNetworkData:dicCell]];
    
    //标题
    _titleLbl.frame = CGRectMake(80, 10, 200, 50);
    _titleLbl.text = [dicCell objectForKey:@"title"];
    
    //年份
    _yearLbl.frame = CGRectMake(80, 60, 100, 50);
    _yearLbl.text = [NSString stringWithFormat:@"年份:%@年",[dicCell objectForKey:@"year"]];

    
    //星级和评分
    _ratingView.frame = CGRectMake(180, 75, 110, 30);
    _ratingView.style = kSmallStyle;
    //  获取评分
    CGFloat fRating = [[[dicCell objectForKey:@"rating"]objectForKey:@"average"] floatValue];
    _ratingView.rating = fRating;
    //  获取星级
    CGFloat fStars = [[[dicCell objectForKey:@"rating"]objectForKey:@"stars"] floatValue];
    _ratingView.stars = fStars;
}
//此处用于获取网络数据并将缓存相应数据
-(NSData *)getAndSaveNetworkData:(NSDictionary *)dicCell
{
    NSString *strRowNo = [NSString stringWithFormat:@"%ld",self.rowNo];
    //此处用于实现将网络数据缓存到本地
    if ([self.localImgData objectForKey:strRowNo]== nil) {
        NSString *imgURL = [[dicCell objectForKey:@"images"]objectForKey:@"medium"];
        //这种数据请求不合理(是同步请求，应该使用异步数据请求以防卡顿)，容易卡顿,一般使用第三方图片加载框架
        //此处对图片进行一个缓存处理，保存到本地吧
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
        [self.localImgData setObject:data forKey:strRowNo];
    }
    return  [self.localImgData objectForKey:strRowNo];
}
//获取评级视图
-(CGRatingView *)getRatingView
{
    return _ratingView;
}
@end
