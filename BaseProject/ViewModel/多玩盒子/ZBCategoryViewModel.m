//
//  ZBItemListViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryViewModel.h"
#import "DuowanNetManager.h"
@implementation ZBCategoryViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[DuowanNetManager getZBCategoryWithCompletionHandle:^(id model, NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:model];
        
        completionHandle(error);
    }];
}
-(ZBCategoryModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(NSString *)tagForRow:(NSInteger)row{
    return [self modelForRow:row].tag;
}
-(NSString *)textForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}
@end
