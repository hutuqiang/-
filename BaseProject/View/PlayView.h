
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface PlayView : UIView
+(PlayView*)shardeInstance;


@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) UIButton *playBtn;

-(void)playWithURL:(NSURL*)musicURL;
@end


