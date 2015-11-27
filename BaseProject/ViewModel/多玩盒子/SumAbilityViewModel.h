//
//  SumAbilityViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuowanNetManager.h"
@interface SumAbilityViewModel : BaseViewModel

@property (assign, nonatomic)NSInteger  rowNumber;


-(SumAbilityModel*)modelForRow:(NSInteger)row;


-(NSString*)titleForRow:(NSInteger)row;
-(NSURL*)iconURLForRow:(NSInteger)row;

@end
