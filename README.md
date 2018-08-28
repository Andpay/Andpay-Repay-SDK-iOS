Andpay-Repay-SDK-iOS
===================
和付帮还SDK-iOS
-------------------
## 简介
AndpayRepaySDK文件夹里面是一个framework、一个资源bundle包、包含芝麻信用sdk的文件夹和包含支付宝钱包sdk的文件夹。<br/>
demo文件夹中，ManualTest是手动接入示例，PodTest是CocoaPods接入示例，示例仅供参考。

## 版本要求
iOS SDK 要求 iOS 8.0 及以上版本

## 接入方法
#### 方法1：CocoaPods接入
1. 在 `Podfile` 添加

```
#必有
pod 'AndpayRepaySDK','~>1.0.1', :subspecs => ["AndpayRepay"]

#项目中引入过芝麻信用SDK则不需要这行
pod 'AndpayRepaySDK','~>1.0.1', :subspecs => ["ZMCreditSDK"]

```

2. 运行 `pod update`
3. 使用 `{project}.xcworkspace` 打开项目，而不是 `{project}.xcodeproj`


#### 方法2：手动接入
1. 获取 SDK<br/>
下载SDK, AndpayRepaySDK文件夹里面是一个framework、一个资源bundle包、包含芝麻信用sdk的文件夹和包含支付宝钱包sdk的文件夹。<br/>
![](https://github.com/Andpay/Andpay-Repay-SDK-iOS/raw/master/img/sdkDir.png)

2. 将.framework文件、.bundle文件以及整个ZMCreditSDK文件夹和AlipaySDK文件夹导入工程中。
(注意：1、如果项目中引入过芝麻信用sdk，则不需要再导入ZMCreditSDK文件夹。2、如果项目中引入过支付宝钱包SDK，则不需要再导入AlipaySDK文件夹。)<br/>

3. 在Target->General中，添加(已有则不需要再添加)<br/>
UIKit.framework<br/>
Foundation.framework<br/>
QuartzCore.framework<br/>
CoreText.framework<br/>
CoreGraphics.framework<br/>
CFNetwork.framework<br/>
MobileCoreServices.framework<br/>
MessageUI.framework<br/>
EventKit.framework<br/>
AssetsLibrary.framework<br/>
CoreMotion.framework<br/>
SystemConfiguration.framework<br/>
CoreTelephony.framework<br/>
libz.tbd<br/>
libxml2.tbd<br/>
libc++.tbd<br/>
![](https://github.com/Andpay/Andpay-Repay-SDK-iOS/raw/master/img/dependencyFrameworks.png)

4. 在Target->Build Setting->Linking->Other Linker Flags添加-ObjC<br/>
![](https://github.com/Andpay/Andpay-Repay-SDK-iOS/raw/master/img/otherLinkerFlags.png)


#### 项目配置:
1. 在Target->Build Setting里搜索Enable Bitcode，将值修改为：NO<br/>
![](https://github.com/Andpay/Andpay-Repay-SDK-iOS/raw/master/img/bitcode.png)


#### 添加字段:
1） Info.plist中添加行<br/>
   Key : Privacy - Location When In Use Usage Description<br/>
   Value : 使用帮还需要获您的地理位置信息[文案可自行配置]<br />
2） Info.plist中添加行<br/>
	Key : Privacy - Contacts Usage Description<br/>
	Value : 使用帮还需要访问您的通讯录[文案可自行配置]<br/>
3） 配置支付宝钱包scheme：Info.plist文件中“URL Types"-"URL Schemes”中配置支付宝scheme。注意下图的“AndpayRepaySDKAlipay”为demo所用，需自行配置独立的scheme。<br/>	
4） Info.plist中添加行<br/>
	添加Key：App Transport Security Settings，类型为字典类型。然后给它添加一个Key：Allow Arbitrary Loads，类型为Boolean类型，值为YES；<br/>
	<br/>
![](https://github.com/Andpay/Andpay-Repay-SDK-iOS/raw/master/img/infoPlist.png)

## 使用
#### 初始化SDK配置

在AppDelegate.m中<br/>

##### 引入头文件

```
#import <AndpayRepaySDK/AndpayRepaySDK.h>
```

##### 初始化
在应用初始化方法中添加sdk的初始化配置

```
APRepaySdkConfig *config = [APRepaySdkConfig new];
//运行环境，生产或者测试
config.productEnvironment = YES;
//是否打开debug调试模式
config.debugMode = NO;
[AndpayRepay initWithConfig:config];
```

#### 处理支付宝APP返回的结果
在AppDelegate.m中处理支付宝返回的结果，注意“AndpayRepaySDKAlipay”为之前配置过的scheme，需自行替换<br/>

```
//ios9以前
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([url.scheme isEqualToString:@"AndpayRepaySDKAlipay"]) {
        [AndpayRepay handleOpenURL:url];
        return YES;
    }
    return YES;
}
//ios9及以后使用以下方法
//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options

```

#### 调用帮还模块接口<br/>
在启动sdk的页面引入头文件

```
#import <AndpayRepaySDK/AndpayRepaySDK.h>
```
${yourController}是你启动sdk的页面。<br/>
${yourDelegate}是你接收sdk回调的代理。<br/>
${params} 扩展字段。<br/>

```
[AndpayRepay startWithProvider:${yourController} delegate:${yourDelegate} params:${params}];
```

###### 其中params包含以下参数：<br/>
mobileNo：用户手机号（必传） <br/>
partyId：商户号（必传）<br/>
token：token（必传）<br/>
alipayScheme：APP的info.plist文件中“URL Types"-"URL Schemes”中配的支付宝scheme（必传, NSString类型）<br/>


	
### sdk事件回调
sdk在运行过程中会发布一些关键性的事件，接入方可以在调用sdk时传入代理对象来获取这些事件的回调<br/>

```
//帮还关闭回调
@optional
-(void)andpayRepayDidFinish;

```




