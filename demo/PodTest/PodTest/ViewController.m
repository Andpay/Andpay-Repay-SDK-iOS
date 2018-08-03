//
//  ViewController.m
//  PodTest
//
//  Created by ML on 2018/8/3.
//  Copyright © 2018年 andpay. All rights reserved.
//

#import "ViewController.h"
#import <AndpayRepaySDK/AndpayRepaySDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [AndpayRepay startWithProvider:self delegate:nil params:@{@"partyId":@"",@"mobileNo":@"",@"token":@"",@"alipayScheme":@"AndpayRepaySDKAlipay"}];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
