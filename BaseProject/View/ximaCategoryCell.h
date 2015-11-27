//
//  ximaCategoryCell.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
// 懒加载插件名称:DZLazyInstantiate

@interface ximaCategoryCell : UITableViewCell

/**  序号标签*/
@property (strong, nonatomic) UILabel *orderLB;
/**  */
@property (strong, nonatomic) TRImageView *iconIV;
@property (strong, nonatomic)  UILabel*titleLb;
/**  */
@property (strong, nonatomic) UILabel *descLb;
/**  */
@property (strong, nonatomic) UILabel *numberLb;
/**  */
@property (strong, nonatomic) TRImageView*numberIV;
/**  */
/**  */
/**  */

@property (strong, nonatomic) UIImage *image;




@end
