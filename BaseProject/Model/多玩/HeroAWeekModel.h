//
//  HeroAWeekModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class HeroAweekDataModel,HeroAweekDataChartsModel,HeroAweekDataChartsRatio_DataModel;
@interface HeroAWeekModel : BaseModel

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) HeroAweekDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end


@interface HeroAweekDataModel : NSObject

@property (nonatomic, strong) NSArray<HeroAweekDataChartsModel *> *charts;
@property (nonatomic, assign) NSInteger averageWinRatio;//average_win_ratio
@property (nonatomic, assign) NSInteger averageKNum;//average_k_num
@property (nonatomic, assign) NSInteger championId;//champion_id
@property (nonatomic, assign) NSInteger averageDNum;//average_d_num
@property (nonatomic, assign) NSInteger averageANum;//average_a_num
@property (nonatomic, assign) NSInteger rank;


@end


@interface HeroAweekDataChartsModel : NSObject
@property (nonatomic, copy) NSString *color;
@property (nonatomic, strong) NSArray<HeroAweekDataChartsRatio_DataModel *> *ratioData;//ratio_data
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *yAxisTitle;//y_axis_title
@end



@interface HeroAweekDataChartsRatio_DataModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger value;

@end

