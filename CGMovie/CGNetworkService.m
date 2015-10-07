//
//  CGNetworkService.m
//  CGMovie
//
//  Created by stu on 11/24/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import "CGNetworkService.h"

@interface CGNetworkService ()

@end

@implementation CGNetworkService
//数据解析方法
+(id)paserData:(NSString *)path
{
    NSData *data =[NSData dataWithContentsOfFile:path];
    NSLog(@"path :%@",path);
    //JSON数据解析
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    return result;
}
//北美票房数据
+(id)northUSAData
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"NorthUSA" ofType:@"json"];
    return [[self paserData:path] objectForKey:@"subjects"];
}
+(id)testData
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"json"];
    return [self paserData:path];
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
