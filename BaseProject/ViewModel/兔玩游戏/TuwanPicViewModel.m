//
//  TuwanPicViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuwanPicViewModel.h"
#import "TuwanNetManager.h"
@implementation TuwanPicViewModel

-(id)initWithAid:(NSString *)aid{
    if (self=[super init]) {
        self.aid=aid;
    }
    return self;
}

-(instancetype)init{
    if (self=[super init]) {
        NSAssert1(NO, @"%s必须使用initWithAid方法初始化", __FUNCTION__);
    }
    return self;
}


-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[TuwanNetManager getTuwanDetailWithType:DetailTypePic Aid:_aid completionHandle:^(TuwanPicModel *model, NSError *error) {
        self.picModel=model;
        completionHandle(error);
    }];
}



-(NSInteger)rowNumber{
    return self.picModel.content.count;
}

-(NSURL*)picURLForRow:(NSInteger)row{
    TuwanPicContentModel*contentModel=self.picModel.content[row];
    return [NSURL URLWithString:contentModel.pic];
}


@end
