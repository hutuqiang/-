//
//  XimalayaNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "RankingListModel.h"
#import "AlbumModel.h"
@interface XimalayaNetManager : BaseNetManager
//*  获取音乐分类列表 top50
//*  @param pageId 当前页数从1开始
+(id)getRankListWithPageId:(NSInteger)pageId kCompletionHandle;



//*  @param ID     音乐组ID
//*  @param pageId 当前页数，从1开始
+(id)getAlbumWithID:(NSInteger)Id   PageId:(NSInteger)pageId kCompletionHandle;




@end
