//
//  TuwanPicViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuwanPicViewController : UIViewController
//此界面内容要根据aid来决定,所以aid是必须的
-(id _Nonnull)initWithAid:(NSString* _Nonnull)aid;
@property (strong, nonatomic) NSString * _Nonnull aid;



@end
