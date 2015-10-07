//
//  CGUSACell.h
//  CGMovie
//
//  Created by stu on 11/27/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGRatingView.h"
@class MovieModel;
@interface CGUSACell : UITableViewCell
{
@private
    UIImageView  *_imgView;
    UILabel      *_titleLbl;
    UILabel      *_yearLbl;
    CGRatingView *_ratingView;
    MovieModel   *_movieModel;
}
-(CGRatingView *)getRatingView;
@property(nonatomic,retain)MovieModel *_movieModel;
@property(strong,nonatomic)NSUserDefaults *localImgData;
@property(nonatomic,assign)NSInteger rowNo;

@end
