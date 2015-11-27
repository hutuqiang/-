//
//  ximaCategoryCell.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ximaCategoryCell.h"

@implementation ximaCategoryCell
-(UILabel *)orderLB{
    if (_orderLB==nil) {
        _orderLB=[[UILabel alloc]init];
        _orderLB.font=[UIFont boldSystemFontOfSize:17];
        _orderLB.textColor=[UIColor lightGrayColor];
        _orderLB.textAlignment=NSTextAlignmentCenter;
        [self.contentView addSubview:_orderLB];
        
        //使用kvo键值观察
        //对orderLb的text值为1
        [_orderLB bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew  task:^(id obj, NSDictionary *change) {
            NSString*value=change[@"new"];
            if ([value isEqualToString:@"1"]) {
                _orderLB.textColor=[UIColor redColor];
            }else if ([value isEqualToString:@"2"]){
                _orderLB.textColor=[UIColor blueColor];
            }else if ([value isEqualToString:@"3"]){
                _orderLB.textColor=[UIColor greenColor];
            }else{
                _orderLB.textColor=[UIColor blackColor];
            }
        }];
        
        
        [self.orderLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(35);
        }];
    }
    return _orderLB;
}
-(TRImageView *)iconIV{
    if (_iconIV==nil) {
        _iconIV=[[TRImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.orderLB.mas_right).mas_equalTo(0);
        }];
    }
    
    return _iconIV;
}
-(UILabel *)titleLb{
    if (_titleLb==nil) {
        _titleLb=[[UILabel alloc]init];
        _titleLb.font=[UIFont systemFontOfSize:18];
        _descLb.textColor=[UIColor lightGrayColor];
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            
        }];
    }
    return _titleLb;
}
-(UILabel *)descLb{
    if (_descLb==nil) {
        _descLb=[[UILabel alloc]init];
        _descLb.font=[UIFont systemFontOfSize:18];
        _descLb.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _descLb;
}

-(TRImageView *)numberIV{
    if (_numberIV==nil) {
        _numberIV=[[TRImageView alloc]init];
        _numberIV.imageView.image=[UIImage imageNamed:@"albumView_top_bg"];
        [self.contentView addSubview:_numberIV];
        [_numberIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-3);
        }];
        
    }
    return _numberIV;
}

-(UILabel *)numberLb{
    if (_numberLb==nil) {
        _numberLb=[[UILabel alloc]init];
        _numberLb.font=[UIFont systemFontOfSize:12];
        _numberLb.textColor=[UIColor lightGrayColor];
        [self addSubview:_numberLb];
        [_numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.numberIV.mas_right).mas_equalTo(2);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-3);
            make.centerY.mas_equalTo(self.numberIV);
        }];
    }
    return _numberLb;
}



-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        //添加依赖autolayout 一定要有顺序,即从左到右，从上向下
        //分割线 左 间距调整
        self.separatorInset=UIEdgeInsetsMake(0,105, 0, 0);
        
        
        
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
