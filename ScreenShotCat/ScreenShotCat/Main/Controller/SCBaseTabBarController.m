//
//  SCBaseTabBarController.m
//  ScreenShotCat
//
//  Created by chen on 2019/5/12.
//  Copyright © 2019 chen. All rights reserved.
//

#import "SCBaseTabBarController.h"
#import "SCBaseNavigationController.h"
#import "SCHomeViewController.h"
#import "SCMailListViewController.h"
#import "SCPersonalViewController.h"

@interface SCBaseTabBarController ()

@end

@implementation SCBaseTabBarController

+(void)initialize
{
    //     tabBaritme 标题未选中的 颜色 大小设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    attrs[NSForegroundColorAttributeName] = attrs[NSForegroundColorAttributeName];
    
    //     tabBaritme 标题选中的 颜色 大小设置
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    //    UIImage  *imge = GetImage(@"tabBar_bottom");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置管理的VC
    [self setUpAllChildVc];
}

-(void)setUpAllChildVc
{
    //  首页
    [self setupChildVC:[[SCHomeViewController alloc]init] title:@"首页" image:@"组 335" selectedImage:@"组 335"];
    //  通讯录
    [self setupChildVC:[[SCMailListViewController alloc]init] title:@"通讯录" image:@"库容" selectedImage:@"组 10"];
    //  个人中心
    [self setupChildVC:[[SCPersonalViewController alloc] init] title:@"个人中心" image:@"个人" selectedImage:@"组 15"];
}

#pragma mark -
/**
 *   设置tabBar子控制器 item 标题，以及图片
 *
 */
- (void )setupChildVC:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    SCBaseNavigationController  *nav = [[SCBaseNavigationController alloc]initWithRootViewController:vc];
    // 设置文字和图片
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    vc.tabBarItem.image = myImage;
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = mySelectedImage;
    vc.tabBarItem.title = title;
    vc.navigationItem.title = title;
    
    [self addChildViewController:nav];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
