//
//  TuwanNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"
#import "TuwanPicModel.h"
#import "TuwanVideoModel.h"


//只要解析类公用一个就可以合写
typedef NS_ENUM(NSUInteger,InfoType){
    InfoTypeTop,    //头条
    InfoTypeDuJia,  //独家
    InfoTypeAnHei3, //暗黑3
    InfoTypeMoShou, //魔兽
    InfoTypeFengBao,    //风暴
    InfoTypeLuShi,      //炉石
    InfoTypeXingJi2,    //星际2
    InfoTypeShouWang,   //守望
    InfoTypeImage,      //图片
    InfoTypeVideo,      //视频
    InfoTypeStrategy,   //攻略
    InfoTypeHuanHua,    //幻化
    InfoTypeHappyNews,//趣闻
    InfoTypeCos,        //COS
    InfoTypeBeautifulGirl//美女
};
typedef NS_ENUM(NSUInteger,DetailType){
    DetailTypeVideo,//视频
    DetailTypePic//图片
};
@interface TuwanNetManager : BaseNetManager

//1.做音频播放的同学，不要添加全局断点，会导致播放音频时项目崩溃，且此崩溃无处可查。
//2.兔玩服务器要求请求参数不能为中文，需要把中文转换为 % 号形势
//3.带有分页的接口一定要抓取2个以上，这样才能找到分页规律
//*  @param type  资讯类型
//*  @param start 当前资讯起始索引值，最小为0
+(id)getTuwanwithInfoType:(InfoType)infoType start:(NSInteger)start kCompletionHandle;


//兔玩页面的详情    aid 来自兔玩model类
+(id)getTuwanDetailWithType:(DetailType)detailType Aid:(NSString*)aid  kCompletionHandle;



@end
