//
//  ZBItemListViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface ZBItemCell : UICollectionViewCell
@property (strong, nonatomic) TRImageView *iconView;
@property (strong, nonatomic) UILabel *nameLb;
@end


@interface ZBItemListViewController : UIViewController
-(instancetype)initWithTag:(NSString*)tag name:(NSString*)name;
@property (strong, nonatomic) NSString *tag;
@end
