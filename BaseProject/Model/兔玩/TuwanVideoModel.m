

//
//  TuwanVideoModel.m
//  BaseProject
//
//  Created by tarena on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuwanVideoModel.h"

@implementation TuwanVideoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"content" : [TuwanVideoContentModel class], @"relevant" : [TuwanVideoRelevantModel class]};
}
@end



@implementation TuwanVideoContentModel
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{@"desc":@"description",@"typeName":@"typename"};
}
@end


@implementation TuwanVideoRelevantModel
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{@"desc":@"description",@"typeName":@"typename"};
}
@end


