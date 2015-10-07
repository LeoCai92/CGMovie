//
//  CGRatingView.m
//  CGRatingViewDemo
//
//  Created by stu on 11/30/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import "CGRatingView.h"

@implementation CGRatingView

#define kSmallWidth 16
#define kSmallHeight 16

#define kNormalWidth 32
#define kNormalHeight 32

#define kFullMark 10
#define kFullStars 100

#pragma mark - init
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initGrayStarView];
        
        [self initYellowStarView];
        
        [self initRatingLable];
    }
    return self;
}
-(void)initGrayStarView
{
    //初始化存放灰色星星的数组
    _grayStarsArray = [[NSMutableArray alloc]initWithCapacity:5];
    for (int index = 0; index < 5; index++) {
        UIImageView *grayStarView = [[UIImageView alloc]initWithFrame:CGRectZero];
        grayStarView.image = [UIImage imageNamed:@"grayStar"];
        [self addSubview:grayStarView];
        [_grayStarsArray addObject:grayStarView];
    }
}
-(void)initYellowStarView
{
    //初始化存放黄色星星的数组
    _yellowStarsArray = [[NSMutableArray alloc]initWithCapacity:5];
    _baseView = [[UIView alloc]initWithFrame:CGRectZero];
    _baseView.backgroundColor = [UIColor clearColor];
    //超过边界时自动裁剪
    _baseView.clipsToBounds = YES;
    [self addSubview:_baseView];
    
    for (int index = 0; index < 5; index++) {
        UIImageView *yellowStarView = [[UIImageView alloc]initWithFrame:CGRectZero];
        yellowStarView.image = [UIImage imageNamed:@"yellowStar"];
        [_baseView addSubview:yellowStarView];
        
        [_yellowStarsArray addObject:yellowStarView];
    }
}
-(void)setRating:(CGFloat)rating
{
    _rating = rating;
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",_rating];
}
-(void)initRatingLable
{
    _ratingLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _ratingLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_ratingLabel];
}

#pragma mark - layout
//排版
-(void)layoutSubviews
{
    [super layoutSubviews];
    int x = 0;
    //初始化星星的大小
    for (int index =0; index < 5; index++) {
        UIView *grayStar = _grayStarsArray[index];
        UIView *yellowStar = _yellowStarsArray[index];
        
        //此处设置星星的大小
        if (self.style == kSmallStyle) {
            grayStar.frame = CGRectMake(x, 0, kSmallWidth, kSmallHeight);
            yellowStar.frame = CGRectMake(x, 0, kSmallWidth, kSmallHeight);
            
            x += kSmallWidth;
        } else {
            grayStar.frame = CGRectMake(x, 0, kNormalWidth, kNormalHeight);
            yellowStar.frame = CGRectMake(x, 0, kNormalWidth, kNormalHeight);
            
            x += kNormalWidth;
        }
    }
    
    float baseViewWidth = 0;
    baseViewWidth = (self.rating /kFullMark ) * x;
    _ratingLabel.textColor = [UIColor orangeColor];
    
    float height = 0;
    //设置黄色星星显示的大小
    if (self.style == kSmallStyle) {
        _baseView.frame = CGRectMake(0, 0, baseViewWidth, kSmallHeight);
        _ratingLabel.font = [UIFont boldSystemFontOfSize:12];
        height = kSmallHeight;
    } else {
        _baseView.frame = CGRectMake(0, 0, baseViewWidth, kNormalHeight);
        _ratingLabel.font = [UIFont boldSystemFontOfSize:25];
        height = kNormalHeight;
    }
    _ratingLabel.frame = CGRectMake(x,0,0,0);
    [_ratingLabel sizeToFit];
    
    //设置self.view也即是基视图的大小
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, x + _ratingLabel.frame.size.width, height);

}
@end
