


//
//  BestGroupViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupViewController.h"
#import "TRImageView.h"
#import "BestGroupViewModel.h"
#import "BestGroupDetailViewController.h"
#define KIVSpace (kWindowW-5*52)/6
@interface BestGroupCell : UITableViewCell
@property (strong, nonatomic) UILabel *titleLB;

@property (strong, nonatomic)  TRImageView*hero1IV;
@property (strong, nonatomic) TRImageView *hero2IV;
@property (strong, nonatomic) TRImageView *hero3IV;
@property (strong, nonatomic) TRImageView *hero4IV;
@property (strong, nonatomic) TRImageView *hero5IV;

@property (strong, nonatomic) UILabel *descLB;
@end

@implementation BestGroupCell


- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font=[UIFont boldSystemFontOfSize:18];
        _titleLB.numberOfLines=2;
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _titleLB;
}


- (TRImageView *)hero1IV {
    if(_hero1IV == nil) {
        _hero1IV = [[TRImageView alloc] init];
        [self.contentView addSubview:_hero1IV];
        [_hero1IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(KIVSpace);
            make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _hero1IV;
}
- (TRImageView *)hero2IV {
    if(_hero2IV == nil) {
        _hero2IV = [[TRImageView alloc] init];
        [self.contentView addSubview:_hero2IV];
        [_hero2IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.hero1IV.mas_right).mas_equalTo(KIVSpace);
            make.centerY.mas_equalTo(self.hero1IV);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _hero2IV;
}

- (TRImageView *)hero3IV {
    if(_hero3IV == nil) {
        _hero3IV = [[TRImageView alloc] init];
        [self.contentView addSubview:_hero3IV];
        [_hero3IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.hero2IV.mas_right).mas_equalTo(KIVSpace);
            make.centerY.mas_equalTo(self.hero2IV);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _hero3IV;
}

- (TRImageView *)hero4IV {
    if(_hero4IV == nil) {
        _hero4IV = [[TRImageView alloc] init];
        [self.contentView addSubview:_hero4IV];
        [_hero4IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.hero3IV.mas_right).mas_equalTo(KIVSpace);
            make.centerY.mas_equalTo(self.hero3IV);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _hero4IV;
}

- (TRImageView *)hero5IV {
    if(_hero5IV == nil) {
        _hero5IV = [[TRImageView alloc] init];
        [self.contentView addSubview:_hero5IV];
        [_hero5IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.hero4IV.mas_right).mas_equalTo(KIVSpace);
            make.centerY.mas_equalTo(self.hero4IV);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _hero5IV;
}

- (UILabel *)descLB {
    if(_descLB == nil) {
        _descLB = [[UILabel alloc] init];
        [self.contentView addSubview:_descLB];
        _descLB.numberOfLines=2;
        _descLB.font=[UIFont systemFontOfSize:14];
        [_descLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.mas_equalTo(self.hero5IV.mas_bottom).mas_equalTo(5);
            make.bottom.mas_equalTo(-5);
            make.right.mas_equalTo(-5);
        }];
    }
    return _descLB;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //选中的cell是浅黄色
        UIView *yelloView=[UIView new];
        yelloView.backgroundColor=kRGBColor(254, 249, 236);
        self.selectedBackgroundView=yelloView;//设置了cell的被选中背景图
    }
    return self;
}
@end



@interface BestGroupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) BestGroupViewModel *bestGroupVM;
@end

@implementation BestGroupViewController
-(BestGroupViewModel *)bestGroupVM{
    if (_bestGroupVM==nil) {
        _bestGroupVM=[[BestGroupViewModel alloc]init];
    }
    return _bestGroupVM;
}
-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView=[UITableView new];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_tableView registerClass:[BestGroupCell class] forCellReuseIdentifier:@"cell"];
        
        _tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.bestGroupVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView .header beginRefreshing];
    
}

#pragma -mark-协议中的方法

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BestGroupCell*cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];

    cell.titleLB.text=[self.bestGroupVM titleForRow:indexPath.row];
    cell.descLB.text=[self.bestGroupVM descForRow:indexPath.row];
    [cell.hero1IV.imageView setImageWithURL:[self.bestGroupVM herosURLForRow:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"w_xue"]];
    [cell.hero2IV.imageView setImageWithURL:[self.bestGroupVM herosURLForRow:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"w_xue"]];
    [cell.hero3IV.imageView setImageWithURL:[self.bestGroupVM herosURLForRow:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"w_xue"]];
    [cell.hero4IV.imageView setImageWithURL:[self.bestGroupVM herosURLForRow:indexPath.row][3] placeholderImage:[UIImage imageNamed:@"w_xue"]];
    [cell.hero5IV.imageView setImageWithURL:[self.bestGroupVM herosURLForRow:indexPath.row][4] placeholderImage:[UIImage imageNamed:@"w_xue"]];

    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bestGroupVM.rowNumber;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //跳过去
    BestGroupDetailViewController*vc=[[BestGroupDetailViewController alloc]initWithTitle:[self.bestGroupVM titleForRow:indexPath.row] desc:[self.bestGroupVM descForRow:indexPath.row] descHeros:[self.bestGroupVM descHerosForRow:indexPath.row] iconURLs:[self.bestGroupVM herosURLForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}
//自动行高
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 90;
//}
@end
