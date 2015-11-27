//
//  TuwanPicViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuwanNetManager.h"
@interface TuwanPicViewModel : BaseViewModel


-(instancetype)initWithAid:(nonnull NSString*)aid;
@property (strong, nonatomic,nonnull) NSString*  aid;
@property (assign, nonatomic) NSInteger  rowNumber;
-(NSURL*)picURLForRow:(NSInteger)row;

@property (strong, nonatomic) TuwanPicModel *picModel;





@end
