//
//  TuwanTableViewCell.h
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface TuwanTableViewCell : UITableViewCell

/** 左侧图片 */
@property (strong, nonatomic) TRImageView *iconIV;
/** 题目标签 */
@property (strong, nonatomic) UILabel *titleLb;
/** 长题目标签*/
@property (strong, nonatomic) UILabel *longTitleLb;
/** 点击数标签 */
@property (strong, nonatomic) UILabel *clicksNumLb;

@end
