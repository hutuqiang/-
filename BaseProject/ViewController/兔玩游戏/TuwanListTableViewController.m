#import "TuwanListTableViewController.h"
#import "TuwanViewModel.h"
#import "TuwanImageTableViewCell.h"
#import "TuwanTableViewCell.h"
#import "iCarousel.h"//滚动小广告
#import "TuWanHtmlViewController.h"
#import "TuwanPicViewController.h"

@interface TuwanListTableViewController ()<iCarouselDataSource,iCarouselDelegate>
@property (strong, nonatomic) TuwanViewModel *tuwanVM;
@end

@implementation TuwanListTableViewController
{//因为不需要懒加载,所以不需要属性
    iCarousel*_ic;
    UIPageControl*_pageControl;
    UILabel*_titleLb;
    NSTimer*_timer;//定时器
}

/**头部滚动视图*/
-(UIView*)headerView{
    
    [_timer invalidate];
    
    //如果当前没有头部视图返回nil
    if(self.tuwanVM.isExistIndexPic==NO){
        return nil;
    }
    //头部his图 x,y无效,宽度无效
    //比例750*500
    UIView*headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/750*500)];
    //添加底部视图
    UIView*bottomView=[UIView new];
    bottomView.backgroundColor=kRGBColor(240, 240, 240);
    [headerView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    
    _titleLb=[UILabel new];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl=[UIPageControl new];
    _pageControl.numberOfPages=self.tuwanVM.indexPicNumber;
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
        
    }];
    _titleLb.text=[self.tuwanVM titleForRowInINdexPic:0];
    //添加滚动栏
    _ic=[iCarousel new];
    [headerView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate=self;
    _ic.dataSource=self;
    _ic.pagingEnabled=YES;
    _ic.scrollSpeed=1;
    //小圆点
    _pageControl.hidesForSinglePage=YES;
    //如果只有一张图,则不可以滚动
    _ic.scrollEnabled=self.tuwanVM.indexPicNumber!=1;
    
    _pageControl.pageIndicatorTintColor=[UIColor redColor];
    _pageControl.currentPageIndicatorTintColor=[UIColor blueColor];
    
    
    if (self.tuwanVM.indexPicNumber>1) {
        _timer=[NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
            
        } repeats:YES];
    }
    //小圆点
    _pageControl.userInteractionEnabled=NO;
    return headerView;
}

-(TuwanViewModel *)tuwanVM{
    if (_tuwanVM==nil) {
        _tuwanVM=[[TuwanViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _tuwanVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TuwanTableViewCell class] forCellReuseIdentifier:@"TuwanTableViewCell"];
    [self.tableView registerClass:[TuwanImageTableViewCell class] forCellReuseIdentifier:@"TuwanImageTableViewCell"];
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.tuwanVM refreshDataCompletionHandle:^(NSError *error) {
           self.tableView.tableHeaderView= [self headerView];
           [self.tableView.header endRefreshing];
           [self.tableView reloadData];
       }];
    }];
    
    self.tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.tuwanVM getMoreDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView= [self headerView];
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
        
    }];
    [self.tableView.header beginRefreshing];//让头部主动刷新一次
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - Table view data source协议方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tuwanVM.rowNumber;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self.tuwanVM containImages:indexPath.row]?135: 90;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.tuwanVM containImages:indexPath.row]) {
        TuwanImageTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"TuwanImageTableViewCell" forIndexPath:indexPath];
        cell.titleLb.text=[self.tuwanVM titleForRowInList:indexPath.row];
        cell.clicksNumLb.text=[self.tuwanVM clicksForRowInList:indexPath.row];
        [cell.iconIV0.imageView setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][0]
            placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV1.imageView setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV2.imageView setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        return cell;
    }
    
    TuwanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TuwanTableViewCell" forIndexPath:indexPath];
    
    
    [cell.iconIV.imageView setImageWithURL:[self.tuwanVM iconURLForRowInList:indexPath.row]placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
    cell.titleLb.text=[self.tuwanVM titleForRowInList:indexPath.row];
    cell.longTitleLb.text=[self.tuwanVM descForRowInList:indexPath.row];
    cell.clicksNumLb.text=[self.tuwanVM clicksForRowInList:indexPath.row];
    return cell;
}

//选中某一行时执行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.tuwanVM isHtmlInListForRow:indexPath.row]) {
        TuWanHtmlViewController*vc=[[TuWanHtmlViewController alloc]initWithURL:[self.tuwanVM detailURLForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([self.tuwanVM isPicInListForRow:indexPath.row]) {
        TuwanPicViewController*vc=[[TuwanPicViewController alloc]initWithAid:[self.tuwanVM aidInListForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}



/** 去掉分割线左侧的缝隙*/
kRemoveCellSeparator



#pragma mark-iCarouselDataSource,iCarouselDelegate协议方法
//滚动小广告有多少页
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.tuwanVM.indexPicNumber;
}

// 滚动小广告每一页视图是什么内容
-(UIView*)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (view==nil) {
        view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750*500-35)];
        UIImageView*imageView=[UIImageView new];
        [view addSubview:imageView];
        imageView.tag=100;
        imageView.contentMode=2;
        view.clipsToBounds=YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
    }
//    NSLog(@"%ld图=%@",index,[self.tuwanVM iconURLForRowInINdexPic:index]);
    UIImageView*imageView=(UIImageView*)[view viewWithTag:100];
    [imageView setImageWithURL:[self.tuwanVM iconURLForRowInINdexPic:index]placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
    
    return view;
}


//设置允许循环滚动
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option==iCarouselOptionWrap) {
        return YES;
    }
    return value;
}


//监控当前滚动到了第几个,只要视图完成了一页视图的滚动,就会执行
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
//    NSLog(@"%ld",carousel.currentItemIndex);
    _titleLb.text=[self.tuwanVM titleForRowInINdexPic:carousel.currentItemIndex];
    _pageControl.currentPage=carousel.currentItemIndex;
}
//选中了小广告中的某一项
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if ([self.tuwanVM isHtmlInIndexPicForRow:index]) {
        TuWanHtmlViewController *vc=[[TuWanHtmlViewController alloc]initWithURL:[self.tuwanVM detailURLForRowInIndexPic:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([self.tuwanVM isPicInIndexPicForRow:index]) {
        TuwanPicViewController*vc=[[TuwanPicViewController alloc]initWithAid:[self.tuwanVM aidInIndexPicForRow:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
