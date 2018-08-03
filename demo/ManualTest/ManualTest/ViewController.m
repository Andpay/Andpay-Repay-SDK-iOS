//
//  ViewController.m
//  ManualTest
//
//  Created by ML on 2018/7/16.
//  Copyright © 2018年 andpay. All rights reserved.
//

#import "ViewController.h"
#import <AndpayRepaySDK/AndpayRepaySDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [AndpayRepay startWithProvider:self delegate:nil params:@{@"partyId":@"",@"mobileNo":@"",@"token":@"",@"alipayScheme":@"AndpayRepaySDKAlipay"}];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
