#import "SearchDetailViewController.h"

@interface SearchDetailViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) UIWebView *webView;


@end

@implementation SearchDetailViewController
-(instancetype)initWithRequest:(NSURLRequest *)request{
    if (self=[super init]) {
        self.request=request;
        //退出来  不显示下方栏
        self.hidesBottomBarWhenPushed=YES;
    }
    return self;
}
-(UIWebView *)webView{
    if (_webView==nil) {
        _webView=[UIWebView new];
        _webView.delegate=self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.title=@"召唤师详情";
    [self.webView loadRequest:_request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma -mark-协议方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //点击web的任意一项跳转到下一页
    NSLog(@"url: %@",request.URL.absoluteString);
    
    if (navigationType!=5) {
        SearchDetailViewController*vc=[[SearchDetailViewController alloc]initWithRequest:request];
        [self.navigationController pushViewController:vc animated:YES];
        return NO;
    }
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    [self hideProgress];
}





@end
