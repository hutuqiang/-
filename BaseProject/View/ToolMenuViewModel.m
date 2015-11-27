//
//  ToolMenuViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ToolMenuViewModel.h"

@implementation ToolMenuViewModel
/**只实现getdata即可*/
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [DuowanNetManager getToolMenuWithCompletionHandle:^(id model, NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:model];
        
        completionHandle(error);
    }];
}


-(NSInteger)rownumber{
    return self.dataArr.count;
}

-(ToolMenuModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].icon];
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}

-(NSString*)tagForRow:(NSInteger)row{
    return [self modelForRow:row].tag;
}

-(NSURL *)webURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].url];
}
-(ToolMenuItemType)itemTypeForRow:(NSInteger)row{
    NSString*type=[self modelForRow:row].type;
    if ([type isEqualToString:@"native"]) {
        return ToolMenuItemTypeNative;
    }else if([type isEqualToString:@"web"]){
        return ToolMenuItemTypeWeb;
    }
    return 0;
}

@end
