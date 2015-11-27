
//
//  XimaMusicListViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XimaMusicListViewController.h"
#import "XimaDetailCell.h"
#import "XimaDetailViewModel.h"
#import "PlayView.h"
@interface XimaMusicListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) XimaDetailViewModel *albumVM;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation XimaMusicListViewController

-(instancetype)initWithAlbumId:(NSInteger)albumId{
    if (self=[super init]) {
        self.albumId=albumId;
    }
    return self;
}
-(XimaDetailViewModel*)albumVM{
    if (_albumVM==nil) {
        _albumVM=[[XimaDetailViewModel alloc]initWithAlbumId:_albumId];
    }
    return _albumVM;
}

-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.tableFooterView=[UIView new];
        [_tableView registerClass:[XimaDetailCell class] forCellReuseIdentifier:@"cell"];
        //给一个猜测的高度,让cell自行计算行高
        _tableView.estimatedRowHeight=UITableViewAutomaticDimension;
        
        _tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.albumVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                    [_tableView.footer resetNoMoreData];/**之前如果是最后一页,那么上拉刷新的状态就不是闲置,下拉刷新*/
                }
                [_tableView.header endRefreshing];
            }];
        }];
        _tableView.footer=[MJRefreshBackFooter footerWithRefreshingBlock:^{
           [self.albumVM getMoreDataCompletionHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error.localizedDescription];
                   [_tableView.footer endRefreshing];
               }else{
                   [_tableView reloadData];
                   if (self.albumVM.isHasMore) {
                       [_tableView.footer endRefreshing];
                   }else{
                       [_tableView.footer endRefreshingWithNoMoreData];
                   }
               }
           }];
        }];
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.albumVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XimaDetailCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell.playImageView.imageView setImageWithURL:[self.albumVM iconURLForRow:indexPath.row]];
    cell.titleLabel.text=[self.albumVM titleForRow:indexPath.row];
    cell.timeGoLabel.text=[self.albumVM timeForRow:indexPath.row];
    cell.authorLabel.text=[self.albumVM authorForRow:indexPath.row];
    cell.numberOfPlayLabel.text=[self.albumVM numberOfPlayForRow:indexPath.row];
    cell.numeberOfLikeLabel.text=[self.albumVM numberOfLoveForRow:indexPath.row];
    cell.numberOfCommentLabel.text=[self.albumVM numberOfCommentForRow:indexPath.row];
    cell.durationLabel.text=[self.albumVM durationForRow:indexPath.row];
    
    return cell;
}


//允许自动行高
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

//选中行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[PlayView shardeInstance]playWithURL:[self.albumVM playURLForRow:indexPath.row]];
}





- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    [self.tableView.header beginRefreshing];
    [self.view addSubview:[PlayView shardeInstance]];
    [[PlayView shardeInstance]mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
}



@end
