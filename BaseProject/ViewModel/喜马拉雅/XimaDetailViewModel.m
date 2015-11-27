//
//  XimaDetailViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XimaDetailViewModel.h"

@implementation XimaDetailViewModel
-(BOOL)isHasMore{
    return _maxPageId>_pageId;
}
-(instancetype)initWithAlbumId:(NSInteger)Id{
    if (self=[super init]) {
        self.Id=Id;
    }
    return self;
}
-(instancetype)init{
    if (self=[super init]) {
        NSAssert1(NO, @"%s", __func__);
    }
    return self;
}


-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[XimalayaNetManager getAlbumWithID:self.Id PageId:self.pageId completionHandle:^(AlbumModel* model, NSError *error) {
        if (_pageId==1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.tracks.list];
        _maxPageId=model.tracks.maxPageId;
        
        completionHandle(error);
    }];
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.pageId=1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    if (self.isHasMore) {
        self.pageId+=1;
        
        [self getDataFromNetCompleteHandle:completionHandle];
    }else{
        NSError*error=[NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据"}];
        completionHandle(error);
    }
    
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(AlbumTracksListModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
/**封面图片*/
-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].albumImage];
}
/**题目*/
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
/**音频来源*/
-(NSString *)authorForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"By%@",[self modelForRow:row].nickname];
}
-(NSString *)numberOfPlayForRow:(NSInteger)row{
    //如果超过万,要显示*.*万
    NSInteger count=[self modelForRow:row].playtimes;
    if (count<10000) {
         return [NSString stringWithFormat:@"%ld",count];
    }else{
        return [NSString stringWithFormat:@"%.ld万",count];
    }
   
}
-(NSString *)numberOfLoveForRow:(NSInteger)row{
    return @([self modelForRow:row].likes).stringValue;
    
//    return [NSString stringWithFormat:@"%ld",[self modelForRow:row].likes];
}
-(NSString *)numberOfCommentForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld",[self modelForRow:row].comments];
}
/**获取某行时长*/
-(NSString *)durationForRow:(NSInteger)row{
    NSInteger duration=[self modelForRow:row].duration;
    NSInteger minute=duration/60;
    NSInteger second=duration%60;
    //%02ld  标书小于两位 用0补位,例如1  显示01
    return [NSString stringWithFormat:@"%02ld:%02ld",minute,second];
}

-(NSString *)timeForRow:(NSInteger)row{
    //创建时间是从1970年到创建时间的秒数
    //获取当前系统时间秒数,也是从1970年到现在的秒数
    NSTimeInterval currentTime=[[NSDate date]timeIntervalSince1970];
    //差值
    NSTimeInterval date=currentTime-[self modelForRow:row].createdAt;
    //秒数转小时
    NSInteger hours=date/3600;
    if (hours<24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    //秒数转天数
    NSInteger days=date/3600/24;
    return [NSString stringWithFormat:@"%ld天数",days];
    
}
-(NSURL *)downLoadURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].downloadUrl];
}
-(NSURL *)playURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].playUrl64];
}
@end
