//
//  CGCellDetaiView.h
//  CGMovie
//
//  Created by stu on 12/1/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "CGRatingView.h"
@interface CGCellDetaiView : UIViewController
{
@private
    CGRatingView *_ratingView;
}
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property(nonatomic,assign)MovieModel *_movieModal;
@property(strong,nonatomic)NSUserDefaults *localImgData;
@property(nonatomic,assign)NSInteger rowNo;
@property (strong, nonatomic) IBOutlet UILabel *movieNameLable;
@property (strong, nonatomic) IBOutlet UILabel *originalTitleLabel;

@end
