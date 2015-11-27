//
//  RunesListModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class RunesListPurpleListModel;

@interface RunesListModel : BaseModel
@property (nonatomic, strong) NSArray<RunesListPurpleListModel *> *purple;//Purple
@property (nonatomic, strong) NSArray<RunesListPurpleListModel *> *blue;//Blue
@property (nonatomic, strong) NSArray<RunesListPurpleListModel *> *yellow;//Yellow
@property (nonatomic, strong) NSArray<RunesListPurpleListModel *> *red;//Red
@end



@interface RunesListPurpleListModel : NSObject
@property (nonatomic, copy) NSString *img;//Img
@property (nonatomic, copy) NSString *name;//Name
@property (nonatomic, copy) NSString *lev3;
@property (nonatomic, assign) NSInteger recom;//Recom
@property (nonatomic, copy) NSString *lev2;
@property (nonatomic, assign) NSInteger iplev3;
@property (nonatomic, copy) NSString *units;//Units
@property (nonatomic, assign) NSInteger type;//Type
@property (nonatomic, copy) NSString *standby;//Standby
@property (nonatomic, copy) NSString *lev1;
@property (nonatomic, assign) NSInteger iplev2;
@property (nonatomic, copy) NSString *alias;//Alias
@property (nonatomic, copy) NSString *prop;//Prop
@property (nonatomic, assign) NSInteger iplev1;

@end


