//
//  RunesListModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RunesListModel.h"

@implementation RunesListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"purple" : [RunesListPurpleListModel class], @"yellow" : [RunesListPurpleListModel class], @"blue" : [RunesListPurpleListModel class], @"red" : [RunesListPurpleListModel class]};
}
+(NSString*)replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName firstCharUpper];
}
@end

@implementation RunesListPurpleListModel
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{
            @"img":@"Img",
            @"name":@"Name",
            @"recom":@"Recom",
            @"units":@"Units",
            @"type":@"Type",
            @"standby":@"Standby",
            @"alias":@"Alias",
            @"prop":@"Prop"
             };
}
@end


