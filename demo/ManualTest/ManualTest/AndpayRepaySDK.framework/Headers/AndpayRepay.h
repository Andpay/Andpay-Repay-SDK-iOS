//
//  AndpayRepay.h
//  AndpayRepaySDK
//
//  Created by ML on 2018/7/3.
//  Copyright © 2018年 andpay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "APRepaySdkConfig.h"
#import "APRepaySdkDelegate.h"

@interface AndpayRepay : NSObject

/**
 初始化sdk配置
 @param config 配置内容项
 */
+(void)initWithConfig:(APRepaySdkConfig *)config;

/**
 启动sdk
 @param provider 起始页面
 @param delegate 帮还关闭后的回调，如不需要可以传nil
 @param params   扩展配置参数
 ###### 其中params包含以下参数：
 mobileNo：用户手机号（必传, NSString类型）
 partyId：商户号（必传, NSString类型）
 token：token（必传, NSString类型）
 alipayScheme：APP的info.plist文件中“URL Types"-"URL Schemes”中配的支付宝scheme（必传, NSString类型）
 */
+(void)startWithProvider:(UIViewController *)provider delegate:(id<APRepaySdkDelegate>)delegate params:(NSDictionary *)params;

+(void)handleOpenURL:(NSURL *)url;

@end



