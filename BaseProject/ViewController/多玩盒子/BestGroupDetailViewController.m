//
//  BestGroupDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupDetailViewController.h"
#import "BestGroupViewModel.h"
#import "BestGroupDetailCell.h"
#import "BestGroupDetailIntroCell.h"
@interface BestGroupDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation BestGroupDetailViewController
-(instancetype)initWithTitle:(NSString *)title desc:(NSString *)desc descHeros:(NSArray *)descHeros iconURLs:(NSArray *)iconURLs{
    if (self=[super init]) {
        self.title=title;
        self.desc=desc;
        self.descHeros=descHeros;
        self.iconURLs=iconURLs;
    }
    return self;
}
-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        [self.view addSubview:_tableView];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        //去掉头部的section和脚步section的显示范围
        _tableView.contentInset=UIEdgeInsetsMake(-1, 0, -10, 0);
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.tableFooterView=[UIView new];
        [_tableView registerClass:[BestGroupDetailCell class] forCellReuseIdentifier:@"heroCell"];
        [_tableView registerClass:[BestGroupDetailIntroCell class] forCellReuseIdentifier:@"IntroCell"];
    }
    return _tableView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"阵容详情";
    [self.tableView reloadData];
    [Factory addBackItemToVC:self];
}



#pragma mark-协议中的方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        BestGroupDetailIntroCell*cell=[tableView dequeueReusableCellWithIdentifier:@"IntroCell"];
        cell.titleLb.text=self.title0;
        cell.descLb.text=self.desc;
        NSArray*arr=@[cell.iconView1,cell.iconView2,cell.iconView3,cell.iconView4,cell.iconView5];
       [arr enumerateObjectsUsingBlock:^(TRImageView*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           [obj.imageView setImageWithURL:self.iconURLs[idx] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
       }];
        return cell;
    }else{
        BestGroupDetailCell*cell=[tableView dequeueReusableCellWithIdentifier:@"heroCell"];
        [cell.heroIV.imageView setImageWithURL:self.iconURLs[indexPath.row]placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        cell.descHeroLb.text=self.descHeros[indexPath.row];
        return cell;
    }
}

//行高
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 90;
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==1) {
        return self.iconURLs.count;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//分区头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
//分区尾高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
@end
