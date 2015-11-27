#import "BaseNetManager.h"

static AFHTTPSessionManager *manager = nil;

@implementation BaseNetManager

+ (AFHTTPSessionManager *)sharedAFManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/css", nil];
        //加进了@"text/plain"
    });
    return manager;
}

//url的结构: ?之前是地址, ?之后是参数
//把path和参数拼接起来,把字符串中的中文转换为 百分号形式(UTF-8),因为服务器不接受中文编码
+(NSString*)percentPathWithPath:(NSString*)path params:(NSDictionary*)params{
    NSMutableString*percentPath=[NSMutableString stringWithString:path];
    NSArray*keys=params.allKeys;
    NSInteger count=keys.count;//因为调用方法比取count指针要消耗CPU时间,所以把得到个数写在循环外面
    //OC语言特性是runtime，实际上我们调用一个方法，底层操作是 在一个方法列表中搜索你调用的方法所在的地址，然后调用完毕后把这个方法名转移到常用方法列表,所以如果再次执行某个方法就在常用方法列表中搜素调用，效率更高
    for (NSInteger i=0; i<count; i++) {
        if (i==0) {
            [percentPath appendFormat:@"?%@=%@",keys[i],params[keys[i]]];
        }else{
            [percentPath appendFormat:@"&%@=%@",keys[i],params[keys[i]]];
        }
    }
    //把字符串中的中文转为UTF-8形式
    return [percentPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}




+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    
    //中文必须转成UTF-8字符串,因为第三方框架里没有解决这个问题
//    path=[self percentPathWithPath:path params:params];
    // 打印网络请求,
    DDLogVerbose(@"Request Path: %@, Params:%@", path, params);
    return [[self sharedAFManager] GET:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        complete(nil, error);
    }];
}


+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete{
    return [[self sharedAFManager] POST:path parameters:params success:^void(NSURLSessionDataTask * task, id responseObject) {
        complete(responseObject, nil);
    } failure:^void(NSURLSessionDataTask * task, NSError * error) {
        [self handleError:error];
        complete(nil, error);
    }];
}

+ (void)handleError:(NSError *)error{
    [[self new] showErrorMsg:error]; //弹出错误信息
}

@end
