//
//  TuwanViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuwanViewModel.h"
#import "TuwanNetManager.h"
#import "TuWanModel.h"
@interface TuwanViewModel : BaseViewModel
/**必须使用此初始化方法,因为有必须传入的参数*/
-(instancetype)initWithType:(InfoType)type;
@property (assign, nonatomic)InfoType  type;



@property (assign, nonatomic)NSInteger  start;
//存放头部滚动栏
@property (strong, nonatomic) NSArray *indexPicArr;
/** 是否有头部滚动栏*/
@property (assign, nonatomic,getter=isExistIndexPic)BOOL  existIndexPic;



@property (assign, nonatomic)NSInteger  rowNumber;
//cell的有些行是带图的,所以做一个判断
-(BOOL)containImages:(NSInteger)row;
/**返回某行数据的题目*/
-(NSString*)titleForRowInList:(NSInteger)row;
/**返回某行数据的图片*/
-(NSURL*)iconURLForRowInList:(NSInteger)row;
/**返回某行数据的描述*/
-(NSString*)descForRowInList:(NSInteger)row;
/**返回某行数据的浏览人数*/
-(NSString*)clicksForRowInList:(NSInteger)row;




/*滚动展示栏的图片**/
-(NSURL*)iconURLForRowInINdexPic:(NSInteger)row;
//滚动展示栏的文字
-(NSString*)titleForRowInINdexPic:(NSInteger)row;
//滚动展示栏的数量
@property (assign, nonatomic)NSInteger  indexPicNumber;

/** 获取列表中某行数据对应的html5链接*/
-(NSURL*)detailURLForRowInList:(NSInteger)row;
/** 获取展示栏中某行数据对应的html5链接*/
-(NSURL*)detailURLForRowInIndexPic:(NSInteger)row;



//通过行数 返回此行中返回对应的图片链接数组
-(NSArray*)iconURLSForRowInList:(NSInteger)row;



/**当前数据类型是视频video*/
-(BOOL)isVideoInListForRow:(NSInteger)row;
-(BOOL)isVideoInIndexPicForRow:(NSInteger)row;
/**当前数据类型是图片 pic*/
-(BOOL)isPicInListForRow:(NSInteger)row;
-(BOOL)isPicInIndexPicForRow:(NSInteger)row;

/**当前数据类型是视频 html all*/
-(BOOL)isHtmlInListForRow:(NSInteger)row;
-(BOOL)isHtmlInIndexPicForRow:(NSInteger)row;


//返回某行数据的aid
-(NSString*)aidInListForRow:(NSInteger)row;
-(NSString*)aidInIndexPicForRow:(NSInteger)row;//

@end
