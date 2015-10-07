//
//  MovieModel.h
//  CGMovie
//
//  Created by stu on 11/25/14.
//  Copyright (c) 2014 cgit.org. All rights reserved.
//

#import <Foundation/Foundation.h>
//{"box" : 38152000,
//    "new" : true,
//    "rank": 1,
//    "subject":{
//        "rating" :{"max" :10,"average" :6.7,"stars" :"35","min" :0},
//        "title" :"遗落战境",
//        "original_title":"Oblivion",
//        "subtype":"movie",
//        "year" :"2013",
//        "images":{
//            "small":"http://img3.douban.com/view/photo/icon/public/p1931650344.jpg",
//            "large":"http://img3.douban.com/view/movie_poster_cover/lpst/public/p1931650344.jpg",
//            "medium":"http://img3.douban.com/view/movie_poster_cover/spst/public/p1931650344.jpg"
//        },
//        "alt":"http://movie.douban.com/subject/3895511/",
//        "id":"3895511"}
@interface MovieModel : NSObject
@property(nonatomic,retain)NSNumber *box;
@property(nonatomic,retain)NSNumber *rank;
@property(nonatomic,retain)NSDictionary *subject;
@end
