//
//  SCBaseNavigationController.m
//  ScreenShotCat
//
//  Created by chen on 2019/5/12.
//  Copyright © 2019 chen. All rights reserved.
//

#import "SCBaseNavigationController.h"
#import "UIBarButtonItem+FYExtension.h"

@interface SCBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation SCBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.navigationBarHidden = YES;
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
    
    // Do any additional setup after loading the view.
    
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = RGB(237, 237, 237); //  导航背景颜色
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [bar setTitleTextAttributes:attrs];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count>0){
        viewController.navigationItem.leftBarButtonItem  = [UIBarButtonItem itemWithImage:@"return" highImage:@"" title:nil titleColor:nil target:self action:@selector(NavBack)];
        
        viewController.hidesBottomBarWhenPushed = YES;
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.interactivePopGestureRecognizer.enabled = YES;
            self.interactivePopGestureRecognizer.delaysTouchesBegan=NO;
        }
    }
    [super pushViewController:viewController animated:animated];
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.childViewControllers.count > 1;
}

- (void)NavBack
{
    [self popViewControllerAnimated:YES];
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
