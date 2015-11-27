//
//  GiftListModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GiftListModel.h"

@implementation GiftListModel

+ (NSDictionary *)objectClassInArray{
    return @{@"a" : [GiftAListModel class], @"d" : [GiftAListModel class], @"g" : [GiftAListModel class]};
}

@end

@implementation GiftAListModel



@end