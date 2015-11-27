//
//  ZBItemListViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface ZBCategoryViewModel : BaseViewModel

@property (assign, nonatomic)NSInteger  rowNumber;

/**tag*/
-(NSString*)tagForRow:(NSInteger)row;
/**text*/
-(NSString*)textForRow:(NSInteger)row;
@end
