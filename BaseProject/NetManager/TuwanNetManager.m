//
//  TuwanNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuwanNetManager.h"

#define KTUWanPath @"http://cache.tuwan.com/app/"
#define KTUWanDetailPath @"http://api.tuwan.com/app/?";
//URL中的参数
//参数key和值都是固定的
#define KAppid @"appid":@1
#define KAppver @"appver":@2.1

//参数的key固定值不固定的
#define KSetDtid(value,dict)  [dict setObject:value forKey:@"dtid"]
#define KSetMod(value,dict)   [dict setObject:value forKey:@"mod"]
#define KSetClass(value,dict)    [dict setObject:value forKey:@"class"]
#define KSetType(value,dict)     [dict setObject:value forKey:@"type"]
#define KSetClassmore(dict) [dict setObject:@"indexpic" forKey:@"classmore"]
#define KsetTypechild(value,dict) [dict setObject:value forKey:@"typechild"]

@implementation TuwanNetManager
+(id)getTuwanwithInfoType:(InfoType)infoType start:(NSInteger)start completionHandle:(void (^)(id, NSError *))completionHandle{
    
    //把URL里的共有参数放在外面
    NSMutableDictionary*params=[NSMutableDictionary dictionaryWithDictionary:@{KAppid,KAppver,@"start":@(start)}];
    switch (infoType) {
        case InfoTypeAnHei3://暗黑3
            KSetDtid(@"83623", params);
            KSetClassmore(params);
            break;
        case InfoTypeBeautifulGirl://美女
            KSetClass(@"heronews", params);
            KSetMod(@"美女", params);
            KSetClassmore(params);
            KsetTypechild(@"cos1", params);
            break;
        case InfoTypeCos://cos
            KSetClass(@"cos", params);
            KSetMod(@"cos", params);
            KSetClassmore(params);
            KSetDtid(@"0", params);
            break;
        case InfoTypeDuJia://独家
            KSetClass(@"heronews", params);
            KSetMod(@"八卦", params);
            break;
        case InfoTypeFengBao://风暴
            KSetDtid(@"31538", params);
            KSetClassmore(params);
            break;
        case InfoTypeHappyNews:// 趣闻
            KSetDtid(@"0", params);
            KSetClass(@"heronews", params);
            KSetMod(@"趣闻", params);
            KSetClassmore(params);
            break;
        case InfoTypeHuanHua: //幻化
            KSetClass(@"heronews", params);
            KSetMod(@"幻化", params);
            break;
        case InfoTypeImage://图
            KSetType(@"pic", params);
            KSetDtid(@"83623,31528,31537,31538,57067,91821", params);
            break;
        case InfoTypeLuShi://炉石
            KSetClassmore(params);
            KSetDtid(@"31528", params);
            break;
        case InfoTypeMoShou://魔兽
            KSetClassmore(params);
            KSetDtid(@"31537", params);
            break;
        case InfoTypeShouWang://守望
            KSetDtid(@"57067", params);
            break;
        case InfoTypeStrategy://攻略
            KSetType(@"guide", params);
            KSetDtid(@"83623,31528,31537,31538,57067,91821", params);
            break;
        case InfoTypeTop://头条
            KSetClassmore(params);
            break;
        case InfoTypeVideo://视频
            KSetType(@"video", params);
            KSetDtid(@"83623,31528,31537,31538,57067,91821", params);
            break;
        case InfoTypeXingJi2://星际2
            KSetDtid(@"91821", params);
            break;
    }
    
    
    //把URL转成中文
    NSString*path=[self percentPathWithPath:KTUWanPath params:params];
    
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TuWanModel objectWithKeyValues:responseObj],error);
    }];
}


//兔玩页面的详情
+(id)getTuwanDetailWithType:(DetailType)detailType Aid:(NSString*)aid completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString*path=KTUWanDetailPath;
    NSDictionary*params=@{@"aid":aid,KAppid};
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        if (detailType==DetailTypeVideo) {

             //这里一定要用firstObj方法来取，不能用[0]。 如果数组为空  第一种不会崩溃，值为nil。
            // 第二种会数组越界 ,而程序崩溃
            completionHandle([TuwanVideoModel objectArrayWithKeyValuesArray:responseObj].firstObject,error);
        }else if (detailType==DetailTypePic){
            //这里要回传的是数组里的字典,因为数组里只有一个元素,这个元素是字典就对应了TuwanPicModel类型
            completionHandle([TuwanPicModel objectArrayWithKeyValuesArray:responseObj].firstObject,error);
        }else{
            NSAssert1(NO, @"%s:type的类型不正确", __func__);//第一个是条件,为假则崩,这里直接给了假
            completionHandle(nil,error);
        }
        
        
    }];
}

@end
