//
//  TuWanHtmlViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanHtmlViewController : UIViewController
@property (strong, nonatomic) NSURL *url;
-(instancetype)initWithURL:(NSURL*)url;
@end
