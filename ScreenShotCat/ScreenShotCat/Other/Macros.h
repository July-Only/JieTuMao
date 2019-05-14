//
//  Macros.h
//  ScreenShotCat
//
//  Created by chen on 2019/5/12.
//  Copyright © 2019 chen. All rights reserved.
//  整个项目的一些宏定义处理

#ifndef Macros_h
#define Macros_h

#ifdef DEBUG
#define DLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
//#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#define _weakself                      __weak typeof(self) weakself = self
#define WEAK_SELF              __weak typeof(self)    weakSelf = self;

// 颜色
#define UIColorFromHEXA(hex,a) [UIColor colorWithRed:((hex & 0xFF0000) >> 16) / 255.0f green:((hex & 0xFF00) >> 8) / 255.0f blue:(hex & 0xFF) / 255.0f alpha:a]
#define UIColorFromRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
// 设置RGB颜色
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBS(r,g,b,s) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:s]
#define  RandomColor(a)     [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:(a)]

// 系统默认字体设置和自选字体设置
#define SystemFontSize(fontsize) [UIFont systemFontOfSize:(fontsize)]
#define SystemBoldFontSize(fontsize) [UIFont boldSystemFontOfSize:(fontsize)]
#define CustomFontSize(fontname,fontsize) [UIFont fontWithName:fontname size:fontsize]

//获取图片资源
#define GetImage(imageName)    [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]
#define imageDomain(imageName) [NSString stringWithFormat:@"%@/upload/%@", REQUEST,imageName]


// 等比例缩放系数
#define KEY_WINDOW    ([UIApplication sharedApplication].keyWindow)
#define SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_SCALE  ((SCREEN_WIDTH > 414) ? (SCREEN_HEIGHT/375.0) : (SCREEN_WIDTH/375.0))
#define Handle(x)        ((x)*SCREEN_SCALE)
#define Handle_width(w)  ((w)*SCREEN_SCALE)
#define Handle_height(h) ((h)*SCREEN_SCALE)

/*===================================
 屏幕宽高
 ===================================*/
#define AppWidth       [UIScreen mainScreen].bounds.size.width
#define AppHeight      [UIScreen mainScreen].bounds.size.height
#define AppBounds      [UIScreen mainScreen].bounds
#define WidthRatio     (AppWidth/375.0f)
#define HeightRatio    (AppHeight/667.0f)

// 字体
#define Font(s)      [UIFont systemFontOfSize:(s)*WidthRatio]

/*===================================
 状态，导航，TabBar
 ===================================*/
#define StatusH        [[UIApplication sharedApplication] statusBarFrame].size.height //状态高度
#define NavigaBarH     self.navigationController.navigationBar.frame.size.height
#define NavigaH        (StatusH + NavigaBarH) //整个导航栏高度
#define TabbarH        AppHeight > 811.0 ? 83.0 : 49.0 //TabBar高度
#define App(s,g)       (s)-(g)

// 网络状态
#define NetWork_MobileNet  @"MobileNet" //3G|4G
#define NetWork_WIFI       @"WIFI" //WIFI
#define NetWork_NONET      @"NONET" //NONET
#define NetworkChangeNotification @"NetworkChangeNotification"

#pragma mark --------------------------protocal----------------------------
/**
 iPhoneX适配
 */
#define iPhoneX ([UIScreen instanceMethodForSelector:@selector(currentMode)]?CGSizeEqualToSize(CGSizeMake(1125,2436),[[UIScreen mainScreen] currentMode].size):NO)

#define kTABBAR_HEIGHT (iPhoneX?(49.f+34.f):49.f)

/**
 Return the statusBar height.
 */
#define kSTATUSBAR_HEIGHT (iPhoneX?44.0f:20.f)

#define LiveRemandViewY   (iPhoneX?44.0f:0.f)

/**
 Return the navigationBar height.
 */
#define kNAVIGATION_HEIGHT (44.f)

/**
 Return the (navigationBar + statusBar) height.
 */
#define kSTATUSBAR_NAVIGATION_HEIGHT (iPhoneX?88.0f:64.f)

/**
 Return 没有tabar 距 底边高度
 */
#define BOTTOM_SPACE_HEIGHT (iPhoneX?34.0f:0.0f)
/**
 Return FLYVIEW 高度
*/
#define FLYVIEW_SPACE_HEIGHT (iPhoneX?280.0f:260.0f)

// 通用控件左右间隔
#define kSpaceToLeftOrRight Handle(10)

// 底部条高度
#define kBottomViewHeight 48

// 导航条高度
#define  kNavigationHeight 64

#pragma mark ------------------------- 项目相关 ------------------------------------

#define NotOpen         [MBProgressHUD showError:@"演示平台暂未开通此功能"];
#define CODE              [[responseObject objectForKey:@"c"] integerValue]
#define Json_list           responseObject[@"d"][@"list"]
#define ERROR            [MBProgressHUD showError:@"网络连接异常，请检查网络设置"]
#define MBErrorMsg     [MBProgressHUD showError:responseObject[@"m"]]
#define MBShow          [MBProgressHUD showHUDAddedTo:self.view animated:YES]
#define MBHidden        [MBProgressHUD hideHUDForView:self.view animated:YES]
#define SuccessCode     200

#define kWebSocketUrl  @"websocketUrl"
#define Type(name)     [messageDict[@"type"] isEqualToString:name]
#define BindPhoneNum   @"bindPhoneNumber"
#define UserHeadImg    @"headImgUrl"
#define UserNickName    @"userNick"


#define kChangeTotalUnread  @"changeUnread"
#define kUnReadKey          @"total_unread"   // 发未读消息通知时unserInfo里的key值
#define UnreadMessageCount  @"unread_count"   // 保存在本地的未读消息总数

#define kSearchHistoryData @"searchHistory"

#define IPhoneID [[[UIDevice currentDevice] identifierForVendor] UUIDString]

//通知
#define RECEIVEPrivateMessage   @"privateMessageNotion"
#define HaveLoginInOtherDevide  @"loginInOtherPhone"
#define SwitchLiveMode          @"SwitchLiveMode"      //切换首页大小图
#define ShareTitle              @"我在恒实APP直播，播你所想，购你所爱"     //  分享标题
#pragma mark - 第三方分享

#define UMengAppKey         @"5abcaf62f43e48054100003e"  //恒实
#define UMengUAppKey        @"5c07e7f3b465f507490005c9"

////微信
#define    WXPayAPPID     @"wx77c96ca3074b7f60"       //恒实
#define    WXAPPSERCET    @"c80693a161dbae6f2d1d2b66bf313a5d"   //恒实

//微博
#define WBAPPKEY      @"2268921765"
#define WBAPPSERCET   @"5d7fee3accfb89112ac07a5356d0d191"
#define REDIRECTURL   @"http://sns.whalecloud.com/sina2/opencallback"
//#define REDIRECTURL  @""
//QQ
#define QQAPPKEY      @"1106317498"
#define QQAPPSERCET   @"kKz0T0fRwvpqF8dV"

#define SHAREURL      @"http://mobile.umeng.com/social"


//JPushKey
#define JPushKey     @"ad4da34b30cea1b59865b52e"
#ifdef DEBUG
#define  JPushIsDebug  0
#else
#define  JPushIsDebug  1
#endif


//错误码
#define kError_InvalidParam                            -10001
#define kError_ConvertJsonFailed                       -10002
#define kError_HttpError                               -10003


#pragma mark ------------------------  用户相关 ------------------------------------

#define kACCOUNT  @"account"

#define kUserID   [[NSUserDefaults standardUserDefaults]objectForKey:@"userId"]
#define kUDID     [[NSUserDefaults standardUserDefaults]objectForKey:@"UDID"]
#define kTOKEN    [[NSUserDefaults standardUserDefaults]objectForKey:@"token"]
#define kStoreID   [[NSUserDefaults standardUserDefaults]objectForKey:@"storeID"]



#define UserDefault [NSUserDefaults standardUserDefaults]

#pragma mark -------------------------  工程配置相关 --------------------
//[[NSUserDefaults standardUserDefaults]objectForKey:@"coin"]
#define  APPCoin           @"appCoin"
#define  APPDot            @"appdot"
#define  APPVersion        @"aPPversion"
#define  APPContent        @"APPcontent"

#define kCoinName [[NSUserDefaults standardUserDefaults]objectForKey:APPCoin]
#define kDotName  [[NSUserDefaults standardUserDefaults]objectForKey:APPDot]
#define kAppName  @"恒实"
#define kIDName   @"ID"
#define kAppIcon  GetImage(@"logo")
#define crashReason     @"crashreson"

#define NeiGouReceipe  @"neigouReceipe"
#define NeiGouReceipeArr  @"NeiGouReceipeArr"

#define OSSIMGREALMNAME  @"OssimageRalmnName"  // 腾讯oss  域名；
#define LivePlaceHolderr GetImage(@"banne_home_loading")
#define ProductPlaceHolder  GetImage(@"default_live")

// 背景色
#define BgColor          @"BgColor"

// ID背景色
#define IDBgColor        @"IdBgColor"

// 分割线
#define  LineColor       @"LineColor"

// 标题颜色
#define TitleColor       @"TitleColor"

// 副标题颜色
#define SubtitleColor    @"SubtitleColor"

// 内容颜色
#define ContentColor     @"ContentColor"

// 导航栏底色
#define NavBgColor       @"NavBgColor"

// 导航栏标题颜色
#define NavTitleColor    @"NavTitleColor"

// tabbar底色
#define TabbarBgColor    @"TabbarBgColor"

// 白色文字
#define WhiteColor       @"WhiteColor"

// 按钮不可点击状态
#define BtnUnEnableBgColor    UIColorFromHEXA(0xF0F0F0,1.0)

// 按钮可点击状态
#define BtnBgColor            UIColorFromHEXA(0xff6490,1.0)
//0xFFD308
// 按钮按压状态
#define BtnSelectedColor      UIColorFromHEXA(0xE23365,1.0)
#define WhiteBackMainColor    UIColorFromHEXA(0xffb108,1.0)
#define PriceColor            UIColorFromHEXA(0xff2f2f,1.0)

#define MainColor             UIColorFromHEXA(0xff6490,1.0)
//#define MainColor             UIColorFromHEXA(0x43dec1,1.0)


#define lineSColor            UIColorFromHEXA(0xe5e5e5,1.0)

#define btnShadowColor        UIColorFromHEXA(0xff6490,0.5)

#define statusColor           [UIColor orangeColor]

#define MainColorHex          0xff6490

#endif /* Macros_h */
