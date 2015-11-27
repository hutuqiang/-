
//
//  ZBCategoryViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ZBCategoryViewController.h"
#import "ZBCategoryViewModel.h"
#import "ZBItemListViewController.h"
@interface ZBCategoryViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) ZBCategoryViewModel *zbCategoryVM;
@end

@implementation ZBCategoryViewController
-(instancetype)init{
    if (self=[super init]) {
        self.title=@"装备分类";
    }
    return self;
}
-(ZBCategoryViewModel *)zbCategoryVM{
    if (_zbCategoryVM==nil) {
        _zbCategoryVM=[ZBCategoryViewModel new];
        
    }
    return _zbCategoryVM;
}

-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView=[UITableView new];
        _tableView.dataSource=self;
        _tableView.delegate=self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.tableFooterView=[UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ZBCategoryCell"];
        _tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.zbCategoryVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [self.tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView.header beginRefreshing];
    [Factory addBackItemToVC:self];
}
#pragma -mark-协议中的方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.zbCategoryVM.rowNumber;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"ZBCategoryCell"];
    cell.textLabel.text=[self.zbCategoryVM textForRow:indexPath.row];
    cell.detailTextLabel.text=[self.zbCategoryVM tagForRow:indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZBItemListViewController*vc=[[ZBItemListViewController alloc]initWithTag:[self.zbCategoryVM tagForRow:indexPath.row] name:[self.zbCategoryVM textForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
