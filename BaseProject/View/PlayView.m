


//
//  PlayView.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PlayView.h"

@implementation PlayView


+(PlayView*)shardeInstance{
    static PlayView *p=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        p=[PlayView new];
    });
    return p;
}
-(instancetype)init{
    if (self=[super init]) {
        self.playBtn.hidden=NO;
        self.backgroundColor=[UIColor redColor];
    }
    return self;
}

-(UIButton *)playBtn{
    if (_playBtn==nil) {
        _playBtn=[UIButton buttonWithType:0];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_play_n_p"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"toolbar_pause_n_p"] forState:UIControlStateSelected];
        [self addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_playBtn bk_addEventHandler:^(UIButton* sender) {
            //select  yes;在播放  NO:暂停
            if (sender.selected) {
                [_player pause];
            }else{
                [_player play];
            }
            sender.selected=!sender.selected;
        } forControlEvents:UIControlEventTouchUpOutside];
        
    }
    return _playBtn;
}


-(void)playWithURL:(NSURL *)musicURL{
    [[AVAudioSession sharedInstance]setCategory:AVAudioSessionCategoryPlayback error:nil];
    //激活
    [[AVAudioSession sharedInstance]setActive:YES error:nil];
    
    _player=[AVPlayer playerWithURL:musicURL];
    [_player play];
}



@end


