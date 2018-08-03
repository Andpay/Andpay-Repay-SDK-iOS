//
//  APRepaySdkDelegate.h
//  AndpayRepaySDK
//
//  Created by ML on 2018/7/11.
//  Copyright © 2018年 ML. All rights reserved.
//

#ifndef APRepaySdkDelegate_h
#define APRepaySdkDelegate_h

@protocol APRepaySdkDelegate <NSObject>

/**
 *  帮还关闭回调
 */
@optional
-(void)andpayRepayDidFinish;

@end

#endif /* APRepaySdkDelegate_h */
