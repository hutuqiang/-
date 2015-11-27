//
//  TuwanPicModel.m
//  BaseProject
//
//  Created by tarena on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuwanPicModel.h"

@implementation TuwanPicModel

+ (NSDictionary *)objectClassInArray{
    return @{@"showitem" : [TuwanPicShowitemModel class], @"relevant" : [TuwanPicRelevantModel class], @"content" : [TuwanPicContentModel class]};
}
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{@"desc":@"description",@"typeName":@"typename"};
}
@end



@implementation TuwanPicInfochildModel

@end


@implementation TuwanPicShowitemModel

@end


@implementation TuwanPicShowItemInfoModel

@end


@implementation TuwanPicRelevantModel
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{@"desc":@"description",@"typeName":@"typename"};
}
@end


@implementation TuwanPicContentModel

@end


@implementation TuwanPicContentInfoModel

@end


