//
//  TuwanImageTableViewCell.h
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface TuwanImageTableViewCell : UITableViewCell
/** 题目标签    */
@property (strong, nonatomic) UILabel *titleLb;
/** 点击数标签    */
@property (strong, nonatomic) UILabel *clicksNumLb;

/** 图片1    */
@property (strong, nonatomic) TRImageView *iconIV0;
/**  图片2   */
@property (strong, nonatomic) TRImageView *iconIV1;

/**  图片3   */
@property (strong, nonatomic) TRImageView *iconIV2;

@end
