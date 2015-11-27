//
//  XiMaCategoryViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XimalayaNetManager.h"
@interface XiMaCategoryViewModel : BaseViewModel

//行数
@property (assign, nonatomic)NSInteger  rowNumber;

//某条数据的图片URL
-(NSURL*)iconURLForRow:(NSInteger)row;
//某条数据的题目
-(NSString*)titleForRow:(NSInteger)row;
//某条数据的描述
-(NSString*)descForRow:(NSInteger)row;
//某条数据的集数
-(NSString*)numberForRow:(NSInteger)row;
//当前页数
@property (assign, nonatomic)NSInteger  pageId;

//当前页数对应的数据id
-(NSInteger)albumIdForRow:(NSInteger)row;

/**当前最大页数*/
@property (assign, nonatomic)NSInteger  maxPageId;

@end
