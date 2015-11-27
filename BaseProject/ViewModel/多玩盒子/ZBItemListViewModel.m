//
//  ZBItemListViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBItemListViewModel.h"
#import "DuowanNetManager.h"
@implementation ZBItemListViewModel

-(instancetype)initWithTag:(NSString *)tag{
    if (self=[super init]) {
        self.tag=tag;
    }
    return self;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[DuowanNetManager getZBItemListWithTag:_tag completionHandle:^(id model, NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:model];
//        self.dataArr=model;
        completionHandle(error);
    }];
}

-(ZBItemListModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(NSString *)idForRow:(NSInteger)row{
    return @([self modelForRow:row].Id).stringValue;
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].text;
}

-(NSURL *)iconURLForRow:(NSInteger)row{
   return  [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%ld_64x64.png", [self modelForRow:row].Id]];
//    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",[self idForRow:row]]];
}

@end
