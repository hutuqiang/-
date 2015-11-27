//
//  ItemDetailModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class ItemDetailExtattrsModel;
@interface ItemDetailModel : BaseModel

@property (nonatomic, strong) ItemDetailExtattrsModel *extAttrs;

@property (nonatomic, copy) NSString *need;

@property (nonatomic, copy) NSString *Id;//id

@property (nonatomic, assign) NSInteger price;

@property (nonatomic, assign) NSInteger allPrice;

@property (nonatomic, assign) NSInteger sellPrice;

@property (nonatomic, copy) NSString *compose;

@property (nonatomic, copy) NSString *extDesc;

@property (nonatomic, copy) NSString *desc;//description

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *tags;

@end


// 首字母改成小写
@interface ItemDetailExtattrsModel : NSObject

@property (nonatomic, assign) NSInteger flatMPPoolMod;//FlatMPPoolMod

@property (nonatomic, assign) NSInteger flatPhysicalDamageMod;//FlatPhysicalDamageMod

@property (nonatomic, assign) CGFloat percentBaseMPRegenMod;// PercentBaseMPRegenMod

@end

