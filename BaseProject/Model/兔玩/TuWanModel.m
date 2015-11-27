
#import "TuWanModel.h"

@implementation TuWanModel



@end




@implementation TuwanDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"indexpic" : [TuwanDataIndexpicModel class], @"list" : [TuwanDataIndexpicModel class]};
}

@end


@implementation TuwanDataIndexpicModel

+ (NSDictionary *)objectClassInArray{
    return @{@"showitem" : [TuwanDataIndexpicShowitemModel class]};
}


@end


@implementation TuwanDataIndexpicInfochildModel
+(NSDictionary*)replacedKeyFromPropertyName{
    return @{
             @"typeName":@"typename",
             @"desc":@"description"
             };
}
@end


@implementation TuwanDataIndexpicShowitemModel

@end


@implementation TuwanDataIndexpicInfochildShowitemInfoModel

@end




