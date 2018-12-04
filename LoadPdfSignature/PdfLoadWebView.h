//
//  PdfLoadWebView.h
//  LoadPdfSignature
//
//  Created by 飞鱼2100 on 2018/10/22.
//  Copyright © 2018年 feiyu.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PdfLoadWebView : UIWebView
/**
 pdf file path
 **/
@property (readonly) NSString *filePath;
@property (copy, nonatomic) NSString *statusStr;//滑动状态

/**
 load pdf file
 
 @param filePath pdf file path
 */
- (void)loadPDFFile:(NSString*)filePath;
- (void)rollBottonAction;
@end
