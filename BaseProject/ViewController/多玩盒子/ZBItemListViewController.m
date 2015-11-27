#import "ZBItemListViewController.h"
#import "ZBItemListViewModel.h"


@implementation ZBItemCell
- (TRImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(_iconView.mas_width);
        }];
    }
    return _iconView;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.textAlignment=NSTextAlignmentCenter;
        _nameLb.font=[UIFont systemFontOfSize:11];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(0);
        }];
    }
    return _nameLb;
}
@end


@interface ZBItemListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) ZBItemListViewModel *zbVM;
@end

@implementation ZBItemListViewController


-(instancetype)initWithTag:(NSString *)tag name:(NSString *)name{
    if (self=[super init]) {
        self.tag=tag;
        self.title=name;
        [Factory addBackItemToVC:self];
    }
    return self;
}

-(ZBItemListViewModel *)zbVM{
    if (_zbVM==nil) {
        _zbVM=[[ZBItemListViewModel alloc]initWithTag:self.tag];
    }
    return _zbVM;
}
-(UICollectionView *)collectionView{
    if (_collectionView==nil) {
        _collectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor=[UIColor whiteColor];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_collectionView registerClass:[ZBItemCell class] forCellWithReuseIdentifier:@"cell"];
        _collectionView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.zbVM getDataFromNetCompleteHandle:^(NSError *error) {
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

#pragma -mark-协议方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.zbVM.rowNumber;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZBItemCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                                              forIndexPath:indexPath];
    [cell.iconView.imageView setImageWithURL:[self.zbVM iconURLForRow:indexPath.row]placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.nameLb.text=[self.zbVM titleForRow:indexPath.row];
    
    return cell;
}
//选中项
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
//行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 20;
}
//每个cell的宽和高
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width=(kWindowW-5*20)/4;
    CGFloat height=width+17;
    return CGSizeMake(width, height);
}
//section分区上下左右边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 20, 5, 20);
}


@end
