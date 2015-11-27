//
//  XimaDetailViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XimalayaNetManager.h"


@interface XimaDetailViewModel : BaseViewModel
/***/

//行数
@property (assign, nonatomic)NSInteger  rowNumber;

@property (assign, nonatomic)NSInteger  Id;
@property (assign, nonatomic)NSInteger  pageId;//当前请求页数
-(instancetype)initWithAlbumId:(NSInteger)Id NS_DESIGNATED_INITIALIZER;
//NS_DESIGNATED_INITIALIZER专门用于初始化


/**最大页数*/
@property (assign, nonatomic)NSInteger  maxPageId;
/**是否有更多页*/
@property (assign, nonatomic,getter=isHasMore)BOOL  hasMore;


/**播放图片*/
-(NSURL*)iconURLForRow:(NSInteger)row;
/**题目标签*/
-(NSString*)titleForRow:(NSInteger)row;
/**作者标签*/
-(NSString*)authorForRow:(NSInteger)row;
/**播放数标签*/
-(NSString *)numberOfPlayForRow:(NSInteger)row;
/**爱心数标签*/
-(NSString *)numberOfLoveForRow:(NSInteger)row;
/**评论数标签*/
-(NSString*)numberOfCommentForRow:(NSInteger)row;
/**时长标签*/
-(NSString*)durationForRow:(NSInteger)row;
/**时间标签*/
-(NSString*)timeForRow:(NSInteger)row;

/**获取某行音频播放地址*/
-(NSURL*)playURLForRow:(NSInteger)row;
/**获取某行下载链接地址*/
-(NSURL*)downLoadURLForRow:(NSInteger)row;

@end
