//
//  SumAbilityDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAbilityDetailViewController.h"
#import "TRImageView.h"
@interface SumAbilityCell:UITableViewCell
@property (strong, nonatomic) UILabel *descLb;
@end

@implementation SumAbilityCell
-(UILabel *)descLb{
    if (_descLb==nil) {
        _descLb=[UILabel new];
        _descLb.font=[UIFont systemFontOfSize:14];
        UIView*grayView=[UIView new];
        grayView.backgroundColor=[UIColor lightGrayColor];
        [self.contentView addSubview:grayView];
        grayView.layer.cornerRadius=4;
        [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(3, 10, 3, 10));
        }];
        UIView*whiteView=[UIView new];
        whiteView.backgroundColor=[UIColor whiteColor];
        [grayView addSubview:whiteView];
        whiteView.layer.cornerRadius=4;
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(1, 1, 1, 1));
        }];
        [whiteView addSubview:_descLb];
        _descLb.numberOfLines=0;
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
        
    }
    return _descLb;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor=[UIColor clearColor];
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}
@end



@interface SumAbilityDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation SumAbilityDetailViewController
-(instancetype)initWithSumAbilityModel:(SumAbilityModel *)abilityModel{
    if (self=[super init]) {
        self.ablityModel=abilityModel;
        self.title=@"召唤师详情";
        [Factory addBackItemToVC:self];
        
    }
    return self;
}

-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.tableFooterView=[UIView new];
        _tableView.backgroundColor=[UIColor clearColor];
        _tableView.allowsSelection=NO;
        _tableView.separatorStyle=0;
        [self.view addSubview:_tableView];
        _tableView.sectionHeaderHeight=23;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.top.mas_equalTo(self.topView.mas_bottom).mas_equalTo(0);
        }];
        [_tableView registerClass:[SumAbilityCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=kRGBColor(246, 247, 251);
    [self.tableView.header beginRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SumAbilityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (indexPath.section == 0) {
        cell.descLb.text = _ablityModel.des;
    }
    if (indexPath.section == 1) {
        cell.descLb.text = _ablityModel.aStrong;
    }
    if (indexPath.section == 2) {
        cell.descLb.text = _ablityModel.tips;
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = self.view.backgroundColor;
    UILabel *lb = [UILabel new];
    [view addSubview:lb];
    lb.backgroundColor = [UIColor clearColor];
    lb.text = @[@"描述", @"天赋强化", @"提示"][section];
    lb.font = [UIFont systemFontOfSize:13];
    lb.textColor=[UIColor lightGrayColor];
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (UIView *)topView {
    if(_topView == nil) {
        _topView = [[UIView alloc] init];
        [self.view addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(90);
        }];
        //        技能图标
        TRImageView *imageView = [TRImageView new];
        [_topView addSubview:imageView];
        NSURL *iconURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png", _ablityModel.Id]];
        [imageView.imageView setImageWithURL:iconURL placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.top.mas_equalTo(8);
        }];
        //        技能名称
        UILabel *abilityLb=[UILabel new];
        abilityLb.text = _ablityModel.name;
        [_topView addSubview:abilityLb];
        [abilityLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(imageView);
        }];
        
        //        需要等级
        UILabel *levelLb=[UILabel new];
        levelLb.text = [@"需要等级 " stringByAppendingString:_ablityModel.level];
        levelLb.font=[UIFont systemFontOfSize:12];
        levelLb.textColor=[UIColor lightGrayColor];
        [_topView addSubview:levelLb];
        [levelLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(abilityLb);
            make.top.mas_equalTo(abilityLb.mas_bottom).mas_equalTo(5);
        }];
        //        冷却时间
        UILabel *coolLb=[UILabel new];
        coolLb.text = [@"冷却时间 " stringByAppendingString:_ablityModel.cooldown];
        coolLb.font=[UIFont systemFontOfSize:12];
        coolLb.textColor=[UIColor lightGrayColor];
        [_topView addSubview:coolLb];
        [coolLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.rightMargin.mas_equalTo(abilityLb);
            make.top.mas_equalTo(levelLb.mas_bottom).mas_equalTo(5);
        }];
        
    }
    return _topView;
}

@end
