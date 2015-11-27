#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "TuWanModel.h"
#import "BaseNetManager.h"
#import "TuwanNetManager.h"
#import "XimalayaNetManager.h"
#import "DuowanNetManager.h"
#import "LeftViewController.h"
#import "TuWanViewController.h"
#import "RankListViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initializeWithApplication:application];
    
    
    self.window.rootViewController=self.sideMenu;
//    self.window.rootViewController=[RankListViewController defaultNavi];
    
    
    
    [self configGlobalUIStyle];//配置全局UI样式
    
    [self testTuwanNetManager];//测试数据
    return YES;
}


/**配置全局UI的样式*/
-(void)configGlobalUIStyle{
/**导航栏不透明 */
/** 导航控制器的导航栏是一个单例,所有的导航控制器都公用这一个,只是显示时各不相同 */
    [[UINavigationBar appearance]setTranslucent:NO];
/**设置导航栏背景图*/
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
/** 配置导航栏题目的样式*/
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:KNaviTitleFontSize],NSForegroundColorAttributeName:KNaviTitleColor}];
    
}

-(UIWindow *)window{
    if (_window==nil) {
        _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}
-(RESideMenu *)sideMenu{
    if (_sideMenu==nil) {
        _sideMenu=[[RESideMenu alloc]initWithContentViewController:[TuWanViewController standardTuWanNavic] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //为侧边栏视图设置背景图
        _sideMenu.backgroundImage=[UIImage imageNamed:@"a4814044"];
        //不允许菜单栏继续缩小
        _sideMenu.bouncesHorizontally=NO;
    }
    return _sideMenu;
}


- (void)testTuwanNetManager {
    
//    //测试兔玩详情
//    [TuwanNetManager getTuwanDetailWithType:DetailTypeVideo Aid:229625 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanDetailWithType:DetailTypeVideo Aid:229729 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    //测试多玩
//    [DuowanNetManager getHeroWithHeroType:HeroTypeFree completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [DuowanNetManager getHeroWithHeroType:HeroTypeAll completionHandle:^(id model, NSError *error) {
//        
//    }];
////    [DuowanNetManager getHeroWithHeroType:10 completionHandle:^(id model, NSError *error) {
////        
////    }];
//    
//    [DuowanNetManager getHeroSkinWithHeroName:@"Braum" completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [DuowanNetManager getHeroSoundWithHeroName:@"Braum" completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [DuowanNetManager getHeroVideoWithTag:@"Braum" page:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [DuowanNetManager getHeroCZWithHeroName:@"Braum" completionHandle:^(id model, NSError *error) {
//        
//    }];//出装
//    [DuowanNetManager getHeroDetailWithHeroName:@"Braum" completionHandle:^(id model, NSError *error) {
//        
//    }];//英雄资料
//    [DuowanNetManager getHeroTop10PlayersNewWithHeroName:@"Braum" completionHandle:^(id model, NSError *error) {
//        
//    }];//排行//测试未通过
//    [DuowanNetManager getHeroSuggestedGiftAndRunWithHeroName:@"Braum" completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [DuowanNetManager getHeroChangeInfoWithHeroName:@"Skarner" completionHandle:^(id model, NSError *error) {
//        
//    }];//英雄改动
//    [DuowanNetManager getHeroAWeekWithHeroId:72 completionHandle:^(id model, NSError *error) {
//        
//    }];//英雄一周信息
//    [DuowanNetManager getToolMenuWithCompletionHandle:^(id model, NSError *error) {
//        
//    }];//游戏百科列表
//    [DuowanNetManager getZBCategoryWithCompletionHandle:^(id model, NSError *error) {
//        
//    }];//装备分类
//    [DuowanNetManager getZBItemListWithTag:@"consumable" completionHandle:^(id model, NSError *error) {
//        
//    }];//某分类装备列表
//    [DuowanNetManager getItemDetailWithId:3004 completionHandle:^(id model, NSError *error) {
//        
//    }];//装备详情
//    [DuowanNetManager getGiftListWithCompletionHandle:^(id model, NSError *error) {
//        
//    }];//天赋列表
//    [DuowanNetManager getRunesListWithCompletionHandle:^(id model, NSError *error) {
//        
//    }];//符文列表
//    [DuowanNetManager getSumAbilityWithCompletionHandle:^(id model, NSError *error) {
//        
//    }];//召唤师技能列表
//    [DuowanNetManager getHeroBestGroupWithCompletionHandle:^(id model, NSError *error) {
//        
//    }];//最佳阵容
    
    
//    //测试喜马拉雅
//    NSString*path=@"http://mobile.ximalaya.com/mobile/others/ca/album/track/3092772/true/1/20?device=iPhone";
//    [BaseNetManager GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
//        
//    }];
//    
//    [XimalayaNetManager getAlbumWithID:3092772 PageId:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [XimalayaNetManager getRankListWithPageId:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    //    NSString*path=@"http://cache.tuwan.com/app/?appid=1&class=heronews&mod=八卦&appid=1&appver=2.1&start=11";
//    //    [BaseNetManager GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
//    //
//    //    }];
//    
//    
//    
//    //测试Tuwan
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeBeautifulGirl start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeCos start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeCos start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeDuJia start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeHappyNews start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeFengBao start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeHuanHua start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeImage start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeShouWang start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeStrategy start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeTop start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeVideo start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];
//    [TuwanNetManager getTuwanwithInfoType:InfoTypeXingJi2 start:1 completionHandle:^(id model, NSError *error) {
//        
//    }];

}
@end
