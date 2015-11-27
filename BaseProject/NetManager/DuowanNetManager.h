//
//  DuowanNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "DuowanModel.h"
typedef NS_ENUM(NSUInteger, HeroType){
    HeroTypeFree,//免费英雄
    HeroTypeAll//全部英雄
};


@interface DuowanNetManager : BaseNetManager
//由于网址相同而进行合写,但model类不同所以返回值是不同的类解析
//免费
+(id)getHeroWithHeroType:(HeroType)heroType kCompletionHandle;

//英雄皮肤
+(id)getHeroSkinWithHeroName:(NSString*)heroName kCompletionHandle;

//英雄配音
//因为这个json数据本身只有一个数组，没有第二层,没有字典,所以没有对应的model类,不需要解析
//直接的json数据就可以拿来用
+(id)getHeroSoundWithHeroName:(NSString*)heroName kCompletionHandle;

//英雄视频
+(id)getHeroVideoWithTag:(NSString*)heroName page:(NSInteger)page kCompletionHandle;

//英雄出装
+(id)getHeroCZWithHeroName:(NSString*)heroName kCompletionHandle;

//英雄资料
+(id)getHeroDetailWithHeroName:(NSString*)heroName kCompletionHandle;

////英雄排行，//不能解决
//+(id)getHeroTop10PlayersNewWithHeroName:(NSString*)heroName kCompletionHandle;

//英雄天赋和符文
+(id)getHeroSuggestedGiftAndRunWithHeroName:(NSString*)heroName kCompletionHandle;

//英雄改动
+(id)getHeroChangeInfoWithHeroName:(NSString*)heroName kCompletionHandle;

//英雄一周信息
+(id)getHeroAWeekWithHeroId:(NSInteger)heroId kCompletionHandle;

//游戏百科列表
+(id)getToolMenuWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

//装备分类
+(id)getZBCategoryWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

//某分类装备列表
+(id)getZBItemListWithTag:(NSString*)tag kCompletionHandle;

//装备详情
+(id)getItemDetailWithId:(NSInteger)Id kCompletionHandle;

//天赋
+(id)getGiftListWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

//符文列表
+(id)getRunesListWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

//召唤师技能列表
+(id)getSumAbilityWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle;
//最佳阵容
+(id)getHeroBestGroupWithCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

@end
