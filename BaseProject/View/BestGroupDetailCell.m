//
//  BestGroupDetailCell.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BestGroupDetailCell.h"

@implementation BestGroupDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (TRImageView *)heroIV {
    if(_heroIV == nil) {
        _heroIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_heroIV];
        [_heroIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(3);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(52, 52));
        }];
    }
    return _heroIV;
}

- (UILabel *)descHeroLb {
    if(_descHeroLb == nil) {
        _descHeroLb = [[UILabel alloc] init];
        _descHeroLb.font=[UIFont boldFlatFontOfSize:18];
        _descHeroLb.numberOfLines = 0;
        [self.contentView addSubview:_descHeroLb];
        [_descHeroLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-10);
        }];
    }
    return _descHeroLb;
}
//这个是cell被取出队列
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

@end
