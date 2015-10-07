//
//  CGRatingView.h
//  CGRatingViewDemo
//
//  Created by stu on 11/30/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
//定义一个枚举类型，来决定创建星星的大小
typedef enum kRatingStyle{
    kSmallStyle = 0,
    kNormalStyle = 1
}kRatingStyle;
@interface CGRatingView : UIView
{
@private
    UIView  *_baseView;
    UILabel *_ratingLabel;
    NSMutableArray *_yellowStarsArray;
    NSMutableArray *_grayStarsArray;

}
@property(nonatomic,assign)kRatingStyle style;
//CGFloat可以自动识别机器位数
@property(nonatomic,assign)CGFloat rating;
@property(nonatomic,assign)CGFloat stars;
@end
