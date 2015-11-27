//
//  RankListViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankListViewController.h"
#import "XiMaCategoryViewModel.h"
#import "ximaCategoryCell.h"
#import "XiMaCategoryViewModel.h"
#import "XimaMusicListViewController.h"
@interface RankListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) XiMaCategoryViewModel *ximaVM;
@end

@implementation RankListViewController

-(XiMaCategoryViewModel *)ximaVM{
    if (_ximaVM==nil) {
        _ximaVM=[XiMaCategoryViewModel new];
    }
    return _ximaVM;
}

-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        
        [_tableView registerClass:[ximaCategoryCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    self.title=@"音乐top50";
    
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.ximaVM refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error];
            }else{
                [self.tableView reloadData];
            }
            //重置脚视图,没有更多数据
            [_tableView.footer resetNoMoreData];
            [_tableView.header endRefreshing];
        }];
    }];
    self.tableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.ximaVM getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
                if (error.code==999) {
                    [self.tableView.footer endRefreshingWithNoMoreData];//这种会显示已经加载完毕
                }
            }else{
                [self.tableView reloadData];
                [_tableView.footer endRefreshing];//不会显示
            }
        }];
    }];
    [self.tableView.header beginRefreshing];
}


+(UINavigationController*)defaultNavi{
    static UINavigationController*navi=nil;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        RankListViewController*vc=[RankListViewController new];
        navi=[[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}



#pragma mark-UITableView协议中的方法
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ximaCategoryCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.titleLb.text=[self.ximaVM titleForRow:indexPath.row];
    cell.descLb.text=[self.ximaVM descForRow:indexPath.row];
    cell.numberLb.text=[self.ximaVM numberForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.ximaVM iconURLForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@"album_novel_finish"]];
    cell.orderLB.text=@(indexPath.row+1).stringValue;
    
    
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ximaVM.rowNumber;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XimaMusicListViewController*vc=[[XimaMusicListViewController alloc]initWithAlbumId:[self.ximaVM albumIdForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170.0/2;
}

@end
