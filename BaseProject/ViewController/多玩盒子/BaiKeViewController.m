
//
//  BaiKeViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaiKeViewController.h"
#import "BaiKeCell.h"
#import "ToolMenuViewModel.h"
#import "TuWanHtmlViewController.h"
#import "BestGroupViewController.h"
#import "ZBCategoryViewController.h"
#import "SumAbilityViewController.h"
@interface BaiKeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) ToolMenuViewModel *toolMenuVM;
@end

@implementation BaiKeViewController
//懒加载
-(ToolMenuViewModel *)toolMenuVM{
    if (_toolMenuVM==nil) {
        _toolMenuVM=[ToolMenuViewModel new];
    }
    return _toolMenuVM;
}


/**实现tableView的懒加载,设置代理,去掉多余cell ,头部刷新*/
/**实现tableview的协议,去掉分割线,去掉选择效果*/

-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView=[[UITableView alloc]init];
        [self.view addSubview:_tableView];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.tableFooterView=[UIView new];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.toolMenuVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                    
                }else{
                    [self.tableView reloadData];
                }
                [self.tableView.header endRefreshing];
            }];
        }];
        [_tableView registerClass:[BaiKeCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

-(instancetype)init{
    if (self=[super init]) {
        self.title=@"游戏百科";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
   
    [self.tableView.header beginRefreshing];
    
}

#pragma -mark-协议中的方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaiKeCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.iconIV setImageWithURL:[self.toolMenuVM iconURLForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.titleLb.text=[self.toolMenuVM titleForRow:indexPath.row];
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.toolMenuVM.rownumber;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.toolMenuVM itemTypeForRow:indexPath.row]==ToolMenuItemTypeWeb) {
        TuWanHtmlViewController*vc=[[TuWanHtmlViewController alloc]initWithURL:[self.toolMenuVM webURLForRow:indexPath.row]];
        
        vc.hidesBottomBarWhenPushed=YES;//隐藏底部的tabbar
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([[self.toolMenuVM tagForRow:indexPath.row] isEqualToString:@"best_group"]) {
        BestGroupViewController*bestVC=[[BestGroupViewController alloc]init];
        bestVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:bestVC animated:YES];
    }
    if ([[self.toolMenuVM tagForRow:indexPath.row] isEqualToString:@"item"]) {
        ZBCategoryViewController*zbVC=[[ZBCategoryViewController alloc]init];
        zbVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:zbVC animated:YES];
    }
    if ([[self.toolMenuVM tagForRow:indexPath.row] isEqualToString:@"sum_ability"]) {
        SumAbilityViewController*saVC=[[SumAbilityViewController alloc]init];
        saVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:saVC animated:YES];
    }
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
