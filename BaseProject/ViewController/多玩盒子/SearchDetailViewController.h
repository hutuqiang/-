//
//  SearchDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDetailViewController : UIViewController


-(instancetype)initWithRequest:(NSURLRequest*)request;
@property (strong, nonatomic) NSURLRequest *request;


@end
