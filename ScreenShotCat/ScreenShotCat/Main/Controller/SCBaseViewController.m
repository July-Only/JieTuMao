//
//  SCBaseViewController.m
//  ScreenShotCat
//
//  Created by chen on 2019/5/12.
//  Copyright © 2019 chen. All rights reserved.
//

#import "SCBaseViewController.h"

@interface SCBaseViewController ()

@property (nonatomic, strong) UIImageView *navBarHairlineImageView;

@end

@implementation SCBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem  = [UIBarButtonItem leftItemWithImage:@"left_black" higthImage:@"" title:nil target:self action:@selector(NavBack)];
    
//    self.view.backgroundColor = CString(BgColor);
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)NavBack;
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)loadData
{
    
}

- (void)dealloc
{
    DLog(@"=============================释放了");
}

// 是否显示导航栏
-(void)setNaviHidden:(BOOL)NaviHidden
{
    if (NaviHidden) {
        _NaviHidden = NaviHidden;
        if (self.NaviHidden == NO) {
            [self.navigationController setNavigationBarHidden:NO animated:YES];
        }else
        {
            [self.navigationController setNavigationBarHidden:YES animated:YES];
        }
    }
}

// 出现时
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    
}


// 消失时
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    self.NaviHidden = NO;
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
