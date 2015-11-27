//
//  TuWanViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuwanViewModel.h"
#import "TuwanListTableViewController.h"

@interface TuWanViewController ()
@property (strong, nonatomic) TuwanViewModel *tuwanVM;
@end


@implementation TuWanViewController
//抽屉效果的内容页的首页应该是单例的,每次进程都只初始化一次
+(UINavigationController*)standardTuWanNavic{
    static UINavigationController*navic=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        TuWanViewController*vc=[[TuWanViewController alloc]initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        //例如设置第一个控制器的某个属性的值
        //vc setValue:[value[0]] forKey:(keys[0];
        //这里是把控制器数组的每一个控制器实例的某个属性 准备整体赋值
        //框架WMPageController,框架会根据keys和values中的的值 通过kvc来给每一个控制器的这个属性赋值
        //在这里TuWanViewController有infoType这个属性
        vc.keys=[self vcKeys];
        vc.values=[self vcValues];
        navic=[[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navic;
}

+(NSArray*)vcValues{
    NSMutableArray*arr=[NSMutableArray new];
    for (int i=0; i<[self itemNames].count; i++) {
        //数值上,vc的infoType的枚举值, 恰好和i值相同
        [arr addObject:@(i)];
    }
    return arr;
}
/** 提供每个题目对应的key值数组,是每个控制器的的属性名*/
+(NSArray*)vcKeys{
    NSMutableArray*arr=[NSMutableArray new];
    for(id obj in [self itemNames]){
        [arr addObject:@"infoType"];//这里的infoType是控制器TuWanViewController的属性名
    }
    return [arr copy];
}
/**提供题目数组*/
+(NSArray*)itemNames{
    return @[@"头条",@"独家",@"暗黑3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"视频",@"攻略",@"幻化",@"趣闻",@"COS",@"美女"];
}



/**提供每个题目对应的控制器的类型*/
+(NSArray*)viewControllerClasses{
    NSMutableArray*arr=[NSMutableArray new];
    //这里的循环只是保持了数量与itemNames相同
    for(id ibj in [self itemNames]){
        [arr addObject:[TuwanListTableViewController class]];
    }
    return [arr copy];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenSeaColor];
    self.title=@"兔玩";
    [Factory addMenuItemToVC:self];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
