#import "XimaDetailCell.h"
@interface XimaDetailCell()
@property (strong, nonatomic) UIImageView* durationIV;
@property (strong, nonatomic) UIImageView *commentIV;
@property (strong, nonatomic) UIImageView *likeIV;
@property (strong, nonatomic) UIImageView *playNumberIV;
@end
@implementation XimaDetailCell
//约束的法则
//Margin用于对齐
//+和-,make的是当前要添加约束的视图,省略第二个视图,代表第二个视图是父视图
//mas_equalTo中要填的值,是第二个视图  -  第一个视图的距离
//ios坐标向下和右是正向增长的


//从左道右从上到下
-(TRImageView *)playImageView{
    if (_playImageView==nil) {
        _playImageView=[TRImageView new];
        [self.contentView addSubview:_playImageView];
        //圆形
        _playImageView.layer.cornerRadius=55/2;
        [_playImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
        //添加播放标识,就是封面上的三角形
        UIImageView*playIV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_album_play"]];
        [_playImageView addSubview:playIV];
        [playIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(25, 25));
            make.center.mas_equalTo(0);
        }];
    }
    return _playImageView;
}

-(UILabel *)titleLabel{
    if (_titleLabel==nil) {
        _titleLabel=[UILabel new];
        //boldSystemFontOfSize是粗体
//        SystemFontOfSize是细体
        _titleLabel.font=[UIFont boldSystemFontOfSize:18];
        _titleLabel.numberOfLines=0;
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.playImageView.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(self.timeGoLabel.mas_left).mas_equalTo(-10);
        }];
         _titleLabel.numberOfLines=0;
    }
    return _titleLabel;
}


-(UILabel *)timeGoLabel{
    if (_timeGoLabel==nil) {
        _timeGoLabel=[UILabel new];
        _timeGoLabel.font=[UIFont systemFontOfSize:12];
        _timeGoLabel.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_timeGoLabel];
        [_timeGoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(45);
        }];
         _timeGoLabel.textAlignment=NSTextAlignmentRight;
    }
    return _timeGoLabel;
}

-(UILabel *)authorLabel{
    if (_authorLabel==nil) {
        _authorLabel=[UILabel new];
        _authorLabel.font=[UIFont systemFontOfSize:16];
        _authorLabel.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_authorLabel];
        [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.authorLabel.mas_leftMargin);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_equalTo(4);
            make.rightMargin.mas_equalTo(self.titleLabel.mas_rightMargin);
        }];
    }
    return _authorLabel;
}

-(UIImageView *)playNumberIV{
    if (_playNumberIV==nil) {
        _playNumberIV=[UIImageView new];
        _playNumberIV.image=[UIImage imageNamed:@"TodayPlayImage"];
        [self.contentView addSubview:_playNumberIV];
        [_playNumberIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35/2, 42/2));
            make.leftMargin.mas_equalTo(self.titleLabel.mas_leftMargin);
            make.top.mas_equalTo(self.authorLabel.mas_bottom).mas_equalTo(5);
        }];
    }
    return _playNumberIV;
}
-(UILabel*)numberOfPlayLabel{
    if (_numberOfPlayLabel==nil) {
        _numberOfPlayLabel=[UILabel new];
        _numberOfPlayLabel.font=[UIFont systemFontOfSize:12];
        _numberOfPlayLabel.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_numberOfPlayLabel];
        [_numberOfPlayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.playNumberIV.mas_right).mas_equalTo(0);
            make.centerY.mas_equalTo(self.playNumberIV.mas_centerY);
        }];
    }
    return _numberOfPlayLabel;
}



-(UIImageView *)likeIV{
    if (_likeIV==nil) {
        _likeIV=[UIImageView new];
        _likeIV.image=[UIImage imageNamed:@"sound_likes_n"];
        [self.contentView addSubview:_likeIV];
        [_likeIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.left.mas_equalTo(self.numberOfPlayLabel.mas_right).mas_equalTo(10);
            make.centerY.mas_equalTo(self.playNumberIV);
            
        }];
    }
    return _likeIV;
}
-(UILabel *)numeberOfLikeLabel{
    if (_numeberOfLikeLabel==nil) {
        _numeberOfLikeLabel=[UILabel new];
        _numeberOfLikeLabel.font=[UIFont systemFontOfSize:12];
        _numeberOfLikeLabel.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_numeberOfLikeLabel];
        [_numberOfPlayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.likeIV.mas_right).mas_equalTo(0);
            make.centerY.mas_equalTo(self.likeIV);
            
        }];
    }
    return _numeberOfLikeLabel;
}


-(UIImageView *)commentIV{
    if (_commentIV==nil) {
        _commentIV=[UIImageView new];
        _commentIV.image=[UIImage imageNamed:@"sound_comments"];
        [self.contentView addSubview:_commentIV];
        [_commentIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.left.mas_equalTo(self.numeberOfLikeLabel.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(self.authorLabel.mas_bottom).mas_equalTo(5);
        }];
    }
    return _commentIV;
}
-(UILabel *)numberOfCommentLabel{
    if (_numberOfCommentLabel==nil) {
        _numberOfCommentLabel=[UILabel new];
        _numberOfCommentLabel.font=[UIFont systemFontOfSize:12];
        _numberOfCommentLabel.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_numberOfCommentLabel];
        [_numberOfPlayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentIV.mas_right).mas_equalTo(0);
            make.centerY.mas_equalTo(self.likeIV);
        }];
    }
    return _numberOfCommentLabel;
}



-(UIImageView *)durationIV{
    if (_durationIV==nil) {
        _durationIV=[UIImageView new];
        _durationIV.image=[UIImage imageNamed:@"sound_duration"];
        [self.contentView addSubview:_durationIV];
        [_durationIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.left.mas_equalTo(self.numberOfCommentLabel.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(self.authorLabel.mas_bottom).mas_equalTo(5);
        }];
    }
    return _durationIV;
}
-(UILabel *)durationLabel{
    if (_durationLabel==nil) {
        _durationLabel=[UILabel new];
        _durationLabel.font=[UIFont systemFontOfSize:12];
        _durationLabel.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_durationLabel];
        [_durationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.durationIV.mas_right).mas_equalTo(0);
            make.topMargin.mas_equalTo(self.durationIV.mas_topMargin);
        }];
    }
    return _durationLabel;
}



-(UIButton *)downLoadButton{
    if (_downLoadButton==nil) {
        _downLoadButton=[UIButton new];
        [_downLoadButton setBackgroundImage:[UIImage imageNamed:@"cell_download"] forState:0];
        [_downLoadButton bk_addEventHandler:^(id sender) {
            DDLogVerbose(@"下载按钮被点击了");
        } forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_downLoadButton];
        [_downLoadButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
//            make.rightMargin.mas_equalTo(self.timeGoLabel.mas_rightMargin);
            make.bottom.right.mas_equalTo(-5);
        }];
    }
    return _downLoadButton;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //设置cell被选中后的背景色
        UIView*view=[UIView new];
        view.backgroundColor=kRGBColor(243, 255, 254);
        self.selectedBackgroundView=view;
        self.separatorInset=UIEdgeInsetsMake(0, 100, 0, 0);
        //为了触发downLoad的懒加载
        self.downLoadButton.hidden=NO;
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
