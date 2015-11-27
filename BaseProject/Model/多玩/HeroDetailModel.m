//
//  HeroDetailModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroDetailModel.h"

@implementation HeroDetailModel


+ (NSDictionary *)objectClassInArray{
    return @{@"like" : [HeroDetailLikeListModel class], @"hate" : [HeroDetailHateListModel class]};
}

+(NSDictionary*)replacedKeyFromPropertyName{
    return @{
             @"BraumW":@"Braum_W",
             @"BraumQ":@"Braum_Q",
             @"desc":@"description",
             @"BraumE":@"Braum_E",
             @"Id":@"id",
             @"BraumB":@"Braum_B",
             @"BraumR":@"Braum_R"
             };
}
@end


@implementation HeroDetailBraumQModel
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{
             @"desc":@"description",
             @"Id":@"id"
             };
}
@end


@implementation HeroDetailBraumRModel

@end


@implementation HeroDetailBraumWModel

@end


@implementation HeroDetailBraumBModel

@end


@implementation HeroDetailBraumEModel

@end


@implementation HeroDetailLikeListModel

@end


@implementation HeroDetailHateListModel

@end


