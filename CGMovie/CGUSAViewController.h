//
//  CGUSAViewController.h
//  CGMovie
//
//  Created by stu on 11/20/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGUSAViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
@private
    UITableView *listTableView;
    UIView      *posterUIView;
    //用于存放数据“模型”
    NSMutableArray *subjectArray;
}
@property(strong,nonatomic)NSUserDefaults *localImgData;
@end
