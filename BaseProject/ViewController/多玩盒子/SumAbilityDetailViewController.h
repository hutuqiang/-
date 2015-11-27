//
//  SumAbilityDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SumAbilityModel.h"
@interface SumAbilityDetailViewController : UIViewController

@property (strong, nonatomic) SumAbilityModel *ablityModel;
-(instancetype)initWithSumAbilityModel:(SumAbilityModel*)abilityModel;

@end
