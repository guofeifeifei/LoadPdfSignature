//
//  ViewController.m
//  LoadPdfSignature
//
//  Created by 飞鱼2100 on 2018/10/22.
//  Copyright © 2018年 feiyu.com. All rights reserved.
//

#import "ViewController.h"
#import "PdfLoadWebView.h"
@interface ViewController (){
    PdfLoadWebView *webView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    webView = [[PdfLoadWebView alloc] initWithFrame:self.view.bounds];
    webView.backgroundColor = [UIColor colorWithRed:62/255.0 green:62/255.0 blue:62/255.0 alpha:1.0];
    [self.view addSubview:webView];
    NSString *pdfFilePath = [[NSBundle mainBundle] pathForResource:@"git搭建" ofType:@"pdf"];
    [webView loadPDFFile:pdfFilePath];
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(100, 100, 100, 100);
//    [btn setBackgroundColor:[UIColor redColor]];
//    [btn setTitle:@"滑动到底部" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(BTN) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
}
- (void)BTN{
    [webView rollBottonAction];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
