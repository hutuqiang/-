//
//  XimalayaNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XimalayaNetManager.h"

@implementation XimalayaNetManager
#define KRankListPath @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album"
#define KAlbumPath     @"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/%@/20"

//*  获取音乐分类列表 top50
//*  @param pageId 当前页数从1开始
+(id)getRankListWithPageId:(NSInteger)pageId kCompletionHandle{
    //只能使用单独传参方式。  使用地址+参数字符串 会导致程序崩溃!
    NSDictionary *params = @{@"device":@"iPhone", @"key":@"ranking:album:played:1:2", @"pageId":@(pageId), @"pageSize": @20, @"position": @0, @"title": @"排行榜"};
    return [self GET:KRankListPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RankingListModel objectWithKeyValues:responseObj], error);
    }];
}



//*  @param ID     音乐组ID
//*  @param pageId 当前页数，从1开始
+(id)getAlbumWithID:(NSInteger)Id   PageId:(NSInteger)pageId kCompletionHandle{
    //  %@  已经拼入 宏定义 kAlbumPath 中
    NSString *path = [NSString stringWithFormat:KAlbumPath, @(Id), @(pageId)];
    return [self GET:path parameters:@{@"device": @"iPhone"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AlbumModel objectWithKeyValues:responseObj], error);
    }];
}
@end
