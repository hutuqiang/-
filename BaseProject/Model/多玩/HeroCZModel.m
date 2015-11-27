//
//  HeroCZModel.m
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroCZModel.h"

@implementation HeroCZModel

+(NSDictionary*)replacedKeyFromPropertyName{
    return @{
        @"userName":@"user_name",
        @"enName":@"en_name",
        @"gameType":@"game_type",
        @"midExplain":@"mid_explain",
        @"niName":@"ni_name",
        @"recordId":@"record_id",
        @"preCz":@"pre_cz",
        @"endExplain":@"end_explain",
        @"endCz":@"end_cz",
        @"costNf":@"cost_nf",
        @"chName":@"ch_name",
        @"nfExplain":@"nf_explain",
        @"preExplain":@"pre_explain",
        @"midCz":@"mid_cz",
        @"nfCz":@"nf_cz"
             };
}
@end


