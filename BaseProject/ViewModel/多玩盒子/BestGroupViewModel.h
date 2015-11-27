//
//  BestGroupViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuowanNetManager.h"
@interface BestGroupViewModel : BaseViewModel
//行数
@property (assign, nonatomic)NSInteger  rowNumber;
//阵容描述
-(NSString*)descForRow:(NSInteger)row;
//阵容title
-(NSString*)titleForRow:(NSInteger)row;
//英雄头像
-(NSArray*)herosURLForRow:(NSInteger)row;
//英雄描述
-(NSArray*)descHerosForRow:(NSInteger)row;

@end
