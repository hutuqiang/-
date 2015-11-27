//
//  BestGroupViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewModel.h"


#define KHeroPath(name) [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",name]
@implementation BestGroupViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [DuowanNetManager getHeroBestGroupWithCompletionHandle:^(id model, NSError *error) {
        [self.dataArr removeAllObjects];
        [self.dataArr addObjectsFromArray:model];
        completionHandle(error);
    }];
}

-(HeroBestGroupModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
//阵容描述
-(NSString*)descForRow:(NSInteger)row{
    return [self modelForRow:row].des;
}

//阵容title
-(NSString*)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
//英雄头像
-(NSArray*)herosURLForRow:(NSInteger)row{
    return @[
         KHeroPath([self modelForRow:row].hero1),
         KHeroPath([self modelForRow:row].hero2),
         KHeroPath([self modelForRow:row].hero3),
         KHeroPath([self modelForRow:row].hero4),
         KHeroPath([self modelForRow:row].hero5),
    ];
}
//英雄描述
-(NSArray*)descHerosForRow:(NSInteger)row{
    return @[
             [self modelForRow:row].des1,
            [self modelForRow:row].des2,
            [self modelForRow:row].des3,
            [self modelForRow:row].des4,
            [self modelForRow:row].des5
    ];
}


@end
