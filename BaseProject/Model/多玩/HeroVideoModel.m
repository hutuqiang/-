//
//  HeroVideoModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroVideoModel.h"

@implementation HeroVideoModel
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{
         @"coverUrl":@"cover_url",
         @"letvVideoUnique":@"letv_video_unique",
         @"letvVideoId":@"letv_video_id",
         @"videoLength":@"video_length",
         @"uploadTime":@"upload_time"
             };
}
@end


