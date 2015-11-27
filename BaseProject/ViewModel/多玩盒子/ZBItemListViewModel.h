//
//  ZBItemListViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface ZBItemListViewModel : BaseViewModel
-(instancetype)initWithTag:(NSString*)tag;
@property (strong, nonatomic) NSString *tag;

@property (assign, nonatomic)NSInteger  rowNumber;


//id
-(NSString*)idForRow:(NSInteger)row;
//title
-(NSString*)titleForRow:(NSInteger)row;
//图
-(NSURL*)iconURLForRow:(NSInteger)row;


@end
