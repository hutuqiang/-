//
//  HeroVideoModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class Esarray;
@interface HeroVideoModel : BaseModel
@property (nonatomic, copy) NSString *coverUrl;//cover_url
@property (nonatomic, copy) NSString *udb;
@property (nonatomic, copy) NSString *channelId;
@property (nonatomic, copy) NSString *uploadTime;//upload_time
@property (nonatomic, copy) NSString *vid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *letvVideoUnique;//letv_video_unique
@property (nonatomic, copy) NSString *letvVideoId;//letv_video_id
@property (nonatomic, assign) NSInteger videoLength;//video_length
@property (nonatomic, assign) NSInteger totalPage;

@end
