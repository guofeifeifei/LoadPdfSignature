//
//  PdfLoadWebView.m
//  LoadPdfSignature
//
//  Created by 飞鱼2100 on 2018/10/22.
//  Copyright © 2018年 feiyu.com. All rights reserved.
//

#import "PdfLoadWebView.h"
@interface PdfLoadWebView()<UIWebViewDelegate>
@end
@implementation PdfLoadWebView



- (void)loadPDFFile:(NSString*)filePath;
{
    _filePath = filePath;
    
    NSString *viwerPath = [[NSBundle mainBundle] pathForResource:@"viewer" ofType:@"html" inDirectory:@"minified/web"];
    NSString *urlStr = [NSString stringWithFormat:@"%@?file=%@#page=1",viwerPath,filePath];
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [self loadRequest:request];
    self.delegate = self;
    self.scrollView.bounces = NO;
    self.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    self.scalesPageToFit=YES;
    self.multipleTouchEnabled=YES;
    self.userInteractionEnabled=YES;
    
    
    
 
}
//滑动到顶部
- (void)rollTopAction{
    int64_t delayInSeconds = 1;      // 延迟的时间
    /*
     *@parameter 1,时间参照，从此刻开始计时
     *@parameter 2,延时多久，此处为秒级，还有纳秒等。10ull * NSEC_PER_MSEC
     */
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // do something
        [self stringByEvaluatingJavaScriptFromString:@"firstPage()"];
//        [self hideToastActivity];
        
    });
}
//滑动到底部
- (void)rollBottonAction{
    int64_t delayInSeconds = 1;      // 延迟的时间
    /*
     *@parameter 1,时间参照，从此刻开始计时
     *@parameter 2,延时多久，此处为秒级，还有纳秒等。10ull * NSEC_PER_MSEC
     */
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // do something
        [self stringByEvaluatingJavaScriptFromString:@"lastPage()"];
//        [self hideToastActivity];
        
    });
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
//    [self makeToastActivity:CSToastPositionCenter];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    NSString *meta = [NSString stringWithFormat:@"var meta = document.createElement('meta');meta.content='width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=10';meta.name='viewport';document.getElementsByTagName('head')[0].appendChild(meta);"];
//    [self stringByEvaluatingJavaScriptFromString:meta];
    
  
    if ([self.statusStr integerValue] == 2) {
        [self rollBottonAction];
    } else if([self.statusStr integerValue] == 1){
        [self rollTopAction];
        
    }else{
//        [self hideToastActivity];
        
    }
}

@end
