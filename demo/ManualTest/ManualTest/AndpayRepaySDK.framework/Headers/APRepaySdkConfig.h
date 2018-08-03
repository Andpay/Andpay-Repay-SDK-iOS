//
//  APRepaySdkConfig.h
//  AndpayRepaySDK
//
//  Created by ML on 2018/7/3.
//  Copyright © 2018年 andpay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APRepaySdkConfig : NSObject

/**
 * sdk运行环境，YES表示生产环境，NO表示测试环境
 */
@property (nonatomic, assign) BOOL productEnvironment;

/**
 * debug日志模式开关，YES表示打开，NO表示关闭
 */
@property (nonatomic, assign) BOOL debugMode;

@end
