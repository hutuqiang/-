//
//  TuwanPicViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuwanPicViewController.h"
#import "TuwanPicViewModel.h"
@interface TuwanPicViewController ()<MWPhotoBrowserDelegate>
@property (strong, nonatomic) TuwanPicViewModel *tuwanPicVM;
@end

@implementation TuwanPicViewController

-(TuwanPicViewModel *)tuwanPicVM{
    if (_tuwanPicVM==nil) {
        _tuwanPicVM=[[TuwanPicViewModel alloc]initWithAid:_aid];
    }
    return _tuwanPicVM;
}


-(id)initWithAid:(NSString *)aid{
    if (self=[super init]) {
        self.aid=aid;
    }
    return self;
}

-(instancetype)init{
    if (self=[super init]) {
        NSAssert1(NO, @"%s必须使用initWithAid方法初始化", __FUNCTION__);
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.view.backgroundColor=[UIColor whiteColor];
    [self showProgress];//显示转圈
    [self.tuwanPicVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self hideProgress];//隐藏转圈
//创建图片展示页面,github上排名最高的图片展示类控件,框架
        MWPhotoBrowser *photoB=[[MWPhotoBrowser alloc]initWithDelegate:self];
        
        //图片展示页面不应该是推出来的，而应该是取代当前页面在导航控制器中的位置
        //获取导航栏管理的所有控制器
        NSMutableArray*navicVCs=[NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        [navicVCs removeLastObject];
//        把图片控制器添加到最后
        [navicVCs addObject:photoB];
//        把新的数组控制器数组赋值给导航控制器
        self.navigationController.viewControllers=navicVCs;
    }];
    
    
}

#pragma -mark-MWPhotoBrowserDelegate协议中的方法
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.tuwanPicVM.rowNumber;
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    MWPhoto*photo=[MWPhoto photoWithURL:[self.tuwanPicVM picURLForRow:index]];
    
    return photo;
}




@end
