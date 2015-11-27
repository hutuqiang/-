

//
//  SearchViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchDetailViewController.h"

#define KPath @"http://lolbox.duowan.com/phone/playerSearchNew.php?lolboxAction=toInternalWebView"

@interface SearchViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) UIWebView *webView;
@end

@implementation SearchViewController


-(instancetype)init{
    if (self=[super init]) {
        self.title=@"召唤师查询";
    }
    return self;
}
-(UIWebView *)webView{
    if (_webView==nil) {
        _webView=[[UIWebView alloc]init];
         [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _webView.delegate=self;
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    NSURL*url=[NSURL URLWithString:KPath];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}


//该方法,如果返回NO,将不会加载请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //点击web的任意一项跳转到下一页
    NSLog(@"url: %@",request.URL.absoluteString);
    //如果当前webView加载的请求,不是当前页面的
    if ([request.URL.path isEqualToString:KPath]==NO) {
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
