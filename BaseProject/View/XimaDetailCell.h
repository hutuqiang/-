#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface XimaDetailCell : UITableViewCell
/**原则上.h文件中只存放需要被调用get或者set方法的属性*/

/**音乐封面图*/
@property (strong, nonatomic) TRImageView *playImageView;



/**题目标签*/
@property (strong, nonatomic) UILabel *titleLabel;
/**音乐来源标签*/
@property (strong, nonatomic) UILabel *authorLabel;
/**时间标签*/
@property (strong, nonatomic) UILabel *timeGoLabel;

/**播放次数标签*/
@property (strong, nonatomic) UILabel *numberOfPlayLabel;


/**喜欢次数标签*/
@property (strong, nonatomic) UILabel *numeberOfLikeLabel;


/**评论数标签*/
@property (strong, nonatomic) UILabel *numberOfCommentLabel;


/**时长标签*/
@property (strong, nonatomic) UILabel *durationLabel;


/**下载按钮*/
@property (strong, nonatomic) UIButton *downLoadButton;

@end
