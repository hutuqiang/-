//
//  SkinHeroModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"


@interface HeroSkinModel : BaseModel

@property (nonatomic, copy) NSString *Id;//id特殊字符
@property (nonatomic, copy) NSString *bigImg;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *smallImg;


@end

