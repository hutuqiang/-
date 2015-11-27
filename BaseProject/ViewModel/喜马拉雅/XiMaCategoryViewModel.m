//  XiMaCategoryViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaCategoryViewModel.h"

@implementation XiMaCategoryViewModel

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId=1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    //如果当前页数已经是最大页数，那么没有必要再发送更多请求了,这样会浪费用户流量
    if (_maxPageId<=_pageId) {
//        [self showErrorMsg:@"没有更多数据了"];
        
        NSError*error=[NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据了"}];
        completionHandle(error);
        return;
    }
    _pageId+=1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[XimalayaNetManager getRankListWithPageId:_pageId completionHandle:^(RankingListModel *model, NSError *error) {
        if (error==nil) {
            if (_pageId==1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:model.list];
            self.maxPageId=model.maxPageId;
        }
        completionHandle(error);
    }];
}


-(RankListListModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(NSInteger)albumIdForRow:(NSInteger)row{
    return [self modelForRow:row].albumId;
}
-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].albumCoverUrl290];
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
-(NSString *)descForRow:(NSInteger)row{
    return [self modelForRow:row].intro;
}
-(NSString *)numberForRow:(NSInteger)row{
    return[NSString stringWithFormat:@"%ld集",[self modelForRow:row].tracks];
}



@end
