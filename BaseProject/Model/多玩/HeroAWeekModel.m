//
//  HeroAWeekModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroAWeekModel.h"

@implementation HeroAWeekModel

@end


@implementation HeroAweekDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"charts" : [HeroAweekDataChartsModel class]};
}

+(NSDictionary*)replacedKeyFromPropertyName{
    return @{
             @"averageWinRatio":@"average_win_ratio",
             @"averageKNum":@"average_k_num",
             @"championId":@"champion_id",
             @"averageDNum":@"average_d_num",
             @"averageANum":@"average_a_num"
             };
}
@end


@implementation HeroAweekDataChartsModel
+ (NSDictionary *)objectClassInArray{
    return @{@"ratio_data" : [HeroAweekDataChartsRatio_DataModel class]};
}
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{
             @"ratioData":@"ratio_data",
             @"yAxisTitle":@"y_axis_title"
             };
}
@end


@implementation HeroAweekDataChartsRatio_DataModel

@end


