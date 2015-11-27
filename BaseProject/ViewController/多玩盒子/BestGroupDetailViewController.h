//
//  BestGroupDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 制作步骤
 1.数据的传入通过在bestGroupViewController中点击任意cell,获得到对应的bestGroupMode类型对象
 2.整体式一个tableView,是group风格,两个分区
 3.有两种类型的cell，一种负责显示团队简介
 4.另一种负责显示每个角色的简介
 5.cell选中以后是浅黄色
 */

@interface BestGroupDetailViewController : UIViewController
@property (strong, nonatomic) NSString *title0;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSArray *descHeros;
@property (strong, nonatomic) NSArray *iconURLs;
-(instancetype)initWithTitle:(NSString*)title
                        desc:(NSString*)desc
                   descHeros:(NSArray*)descHeros
                    iconURLs:(NSArray*)iconURLs;
@end
