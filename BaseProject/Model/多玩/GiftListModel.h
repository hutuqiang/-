//
//  GiftListModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class GiftAListModel;

@interface GiftListModel : BaseModel
@property (strong, nonatomic) NSArray<GiftAListModel *> *a;
@property (strong, nonatomic) NSArray<GiftAListModel *> *d;
@property (strong, nonatomic) NSArray<GiftAListModel *> *g;
@end


@interface GiftAListModel : BaseModel
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<NSString *> *level;
@end