//
//  DuowanNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DuowanNetManager.h"
#import "DuowanRequestPath.h"

//很多具有共同点的东西，可以统一宏定义, 比如
//凡是自己写的宏定义 都需要用k开头,习惯而已






#define  kOSType  @"OSType":[@"iOS" stringByAppendingString\
:[UIDevice currentDevice].systemVersion]
//当前手机的系统版本,需要到info文件中去取
#define KType(value) @"type":value
#define KV  @"v":@140
#define KVersionName @"versionName":@"2.4.0"
@implementation DuowanNetManager
//所有英雄和免费英雄
+(id)getHeroWithHeroType:(HeroType)heroType completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString*path=KHeroPath;
    
    NSDictionary*params=nil;
    switch (heroType) {
        case HeroTypeAll:
            params=@{kOSType,KV,KType(@"all")};
            return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
                completionHandle([AllHeroModel objectWithKeyValues:responseObj],error);
            }];
        case HeroTypeFree:
            
            params=@{kOSType,KV,KType(@"free")};
            return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
                completionHandle([FreeHeroModel objectWithKeyValues:responseObj],error);
            }];
        default:
            NSAssert1(NO, @"%s:type的类型不正确", __func__);//第一个是条件,为假则崩,这里直接给了假
            return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
                completionHandle(nil,error);
            }];
            
    }
}

//英雄皮肤
+(id)getHeroSkinWithHeroName:(NSString*)heroName kCompletionHandle{
    NSDictionary*params=@{@"hero":heroName,KV,kOSType,KVersionName};
    NSString*path=KHeroSkinPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        //由于从网络的二进制数据json解析后的responseObj是数组类型,且有下层,有字典,但根是数组不是字典,
        //所以用objectArrayWithKeyValuesArray:进行解析
        completionHandle([HeroSkinModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}


//英雄配音
//因为这个json数据本身只有一个数组，没有第二层,没有字典,所以没有对应的model类,不需要解析
//直接的json数据就可以拿来用
+(id)getHeroSoundWithHeroName:(NSString*)heroName kCompletionHandle{
    NSDictionary*params=@{@"hero":heroName,KV,kOSType,KVersionName};
    NSString*path=kHeroSoundPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        //由于从网络的二进制数据json解析后的responseObj是数组,没有字典，所以没有对应的对象,也不需要进行对象解析,直接拿来用
        completionHandle(responseObj,error);
    }];
}

//英雄视频
+(id)getHeroVideoWithTag:(NSString*)heroName page:(NSInteger)page kCompletionHandle{
    NSDictionary*params=@{@"action":@"l",@"src":@"letv",KV,@"p":@(page),kOSType,@"tag":heroName};
    NSString*path=KHeroVideoPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        //由于从网络的二进制数据json解析后的responseObj是数组类型,且有下层,有字典,但根是数组不是字典,
        //所以用objectArrayWithKeyValuesArray:进行解析
        completionHandle([HeroVideoModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

//英雄出装
+(id)getHeroCZWithHeroName:(NSString*)heroName kCompletionHandle{
    NSDictionary*params=@{KV,kOSType,@"championName":heroName,@"limit":@7};
    NSString*path=KHeroCZPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        //由于从网络的二进制数据json解析后的responseObj是数组类型,且有下层,有字典,但根是数组不是字典,
        //所以用objectArrayWithKeyValuesArray:进行解析
        completionHandle([HeroCZModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

//英雄资料
+(id)getHeroDetailWithHeroName:(NSString*)heroName kCompletionHandle{
    NSDictionary*params=@{KV,kOSType,@"heroName":heroName};
    NSString*path=KHeroDetailPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroDetailModel objectWithKeyValues:responseObj],error);
    }];
}
//英雄排行

//不能解决
+(id)getHeroTop10PlayersNewWithHeroName:(NSString *)heroName completionHandle:(void (^)(id, NSError *))completionHandle{
    NSDictionary*params=@{@"heroName":heroName};
    NSString*path=kHeroTop10Path;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle(responseObj,error);
    }];
}

//英雄天赋和符文
+(id)getHeroSuggestedGiftAndRunWithHeroName:(NSString*)heroName kCompletionHandle{
    NSDictionary*params=@{@"hero":heroName,KV,kOSType};
    NSString*path=KHeroSuggestedGiftAndRunPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroRuneAndTalentModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

//英雄改动
+(id)getHeroChangeInfoWithHeroName:(NSString*)heroName kCompletionHandle{
    NSDictionary*params=@{@"name":heroName,KV,kOSType};
    NSString*path=KHeroChangePath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroChangeModel objectWithKeyValues:responseObj],error);
    }];
}

//英雄一周信息
+(id)getHeroAWeekWithHeroId:(NSInteger)heroId completionHandle:(void (^)(id, NSError *))completionHandle{
    NSDictionary*params=@{@"heroId":@(heroId)};
    NSString*path=KHeroAweekPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroAWeekModel objectWithKeyValues:responseObj],error);
    }];
}

//游戏百科列表
+(id)getToolMenuWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSDictionary*params=@{KV,KVersionName,kOSType,@"category":@"database"};
    NSString*path=KTOOLMenuPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ToolMenuModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}
//装备分类
+(id)getZBCategoryWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSDictionary*params=@{KV,KVersionName,kOSType};
    NSString*path=KZBCategoryPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZBCategoryModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}



//某分类装备列表
+(id)getZBItemListWithTag:(NSString*)tag kCompletionHandle{
    NSDictionary*params=@{KV,KVersionName,kOSType,@"tag":tag};
    NSString*path=KZBItemListPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([ZBItemListModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

//装备详情
+(id)getItemDetailWithId:(NSInteger)Id completionHandle:(void (^)(id, NSError *))completionHandle{
    NSDictionary*params=@{KV,kOSType,@"id":@(Id)};
    NSString*path=KItemDetailPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([ItemDetailModel objectWithKeyValues:responseObj],error);
    }];
}

//天赋
+(id)getGiftListWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSDictionary*params=@{KV,kOSType};
    NSString*path=KGiftListPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([GiftListModel objectWithKeyValues:responseObj],error);
    }];
}

//符文列表
+(id)getRunesListWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSDictionary*params=@{KV,kOSType};
    NSString*path=KRunesListPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([RunesListModel objectWithKeyValues:responseObj],error);
    }];
}

//召唤师技能列表
+(id)getSumAbilityWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSDictionary*params=@{KV,kOSType};
    NSString*path=KSumAbilityPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([SumAbilityModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

//最佳阵容
+(id)getHeroBestGroupWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle{
    NSDictionary*params=@{KV,kOSType};
    NSString*path=KHeroBestGroupPath;
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroBestGroupModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

@end




