//
//  Factory.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "Factory.h"

@implementation Factory
+(void)addMenuItemToVC:(UIViewController *)vc{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"zone_post_red"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"zone_post_n"] forState:UIControlStateHighlighted];
    button.frame=CGRectMake(0, 0, 45, 45);
    [button bk_addEventHandler:^(id sender) {
        [vc.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem*menuItem=[[UIBarButtonItem alloc]initWithCustomView:button];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem*spaceItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemFixedSpace) target:nil action:nil];
    spaceItem.width=-10;
    vc.navigationItem.leftBarButtonItems=@[spaceItem,menuItem];

}


//向某个控制器上，添加返回按钮到该控制器的导航栏里,
+(void)addBackItemToVC:(UIViewController*)vc{
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"btn_back_n"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"btn_back_h"] forState:UIControlStateHighlighted];
    button.frame=CGRectMake(0, 0, 45, 45);
    [button bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*menuItem=[[UIBarButtonItem alloc]initWithCustomView:button];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem*spaceItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemFixedSpace) target:nil action:nil];
    spaceItem.width=-16;
    vc.navigationItem.leftBarButtonItems=@[spaceItem,menuItem];
}

@end
