//
//  SumAbilityViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityViewModel.h"
#import "DuowanNetManager.h"
@implementation SumAbilityViewModel


-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [DuowanNetManager getSumAbilityWithCompletionHandle:^(id model, NSError *error) {
        if (error==nil) {
            [self.dataArr removeAllObjects];
            self.dataArr=model;
        }
        completionHandle(error);
    }];
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(SumAbilityModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].name;
}

-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png",[self modelForRow:row].Id]];
}

@end
