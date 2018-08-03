Pod::Spec.new do |s|

  s.name         = "AndpayRepaySDK"
  s.version      = "1.0.0"
  s.summary      = "Andpay-Repay-SDK-iOS"

  s.homepage     = "https://github.com/Andpay/Andpay-Repay-SDK-iOS.git"

  s.license      = "Copyright (c) 2018年 Andpay."

  s.author       = { "Michael" => "lijia.lu@andpay.me" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "#{s.homepage}", :tag => "#{s.version}" }


  s.default_subspec = 'AndpayRepay'


  s.subspec "AndpayRepay" do |base|
    base.resources = 'AndpayRepaySDK/AndpayRepaySDKBundle.bundle'
    base.ios.vendored_frameworks = 'AndpayRepaySDK/AndpayRepaySDK.framework'
    base.libraries = "xml2"
  end

  s.subspec "ZMCreditSDK" do |ss|
    ss.resources = 'AndpayRepaySDK/ZMCreditSDK/H5Service.bundle','AndpayRepaySDK/ZMCreditSDK/Poseidon.bundle'
    ss.ios.vendored_frameworks = 'AndpayRepaySDK/ZMCreditSDK/ZMCreditSDK.framework'
    ss.frameworks = "MobileCoreServices", "CFNetwork", "MessageUI", "EventKit", "AssetsLibrary", "CoreMotion", "SystemConfiguration", "CoreTelephony"
    ss.libraries = "z"
  end

  s.subspec "AlipaySDK" do |sss|
    sss.resources = 'AndpayRepaySDK/AlipaySDK/AlipaySDK.bundle'
    sss.ios.vendored_frameworks = 'AndpayRepaySDK/AlipaySDK/AlipaySDK.framework'
    sss.frameworks = "UIKit", "SystemConfiguration", "QuartzCore", "CoreTelephony", "CoreText", "CoreGraphics", "Foundation", "CoreMotion", "CFNetwork"
    sss.libraries = "z", "c++"
  end



end
