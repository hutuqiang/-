//
//  SumAbilityViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 ;. All rights reserved.
//

#import "SumAbilityViewController.h"
#import "ZBItemListViewController.h"
#import "SumAbilityViewModel.h"
#import "SumAbilityDetailViewController.h"
@interface SumAbilityViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) SumAbilityViewModel *saVM;
@end

@implementation SumAbilityViewController

-(instancetype)init{
    if (self=[super init]) {
        [Factory addBackItemToVC:self];
        self.title=@"召唤师技能列表";
    }
    return self;
}

-(SumAbilityViewModel *)saVM{
    if (_saVM==nil) {
        _saVM=[SumAbilityViewModel new];
    }
    return _saVM;
}
-(UICollectionView *)collectionView{
    if (_collectionView==nil) {
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor=[UIColor whiteColor];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_collectionView registerClass:[ZBItemCell class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
           [self.saVM getDataFromNetCompleteHandle:^(NSError *error) {
               if (error) {
                   [self showErrorMsg:error.localizedDescription];
               }else{
                   [_collectionView reloadData];
               }
               [_collectionView.header endRefreshing];
           }];
        }];
        
    }
    return _collectionView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView.header beginRefreshing];
}


kRemoveCellSeparator;
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBItemCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.iconView.imageView setImageWithURL:[self.saVM iconURLForRow:indexPath.row ]placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.nameLb.text=[self.saVM titleForRow:indexPath.row];
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.saVM.rowNumber;
}
//选中项
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SumAbilityDetailViewController*vc=[[SumAbilityDetailViewController alloc]initWithSumAbilityModel:[self.saVM modelForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

//行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}
//每个宽高
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kWindowW - 5 * 20) / 4;
    CGFloat height = width + 17;
    return CGSizeMake(width, height);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}
@end
