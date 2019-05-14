//
//  SCBaseViewController.h
//  ScreenShotCat
//
//  Created by chen on 2019/5/12.
//  Copyright © 2019 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCBaseViewController : UIViewController

/**  隐藏导航栏
 *   YES：隐藏  NO：不隐藏  默认是“NO”
 */
@property (nonatomic ,assign)BOOL NaviHidden;

- (void)loadAbankViewWithSuperView:(UIView *)superView frame:(CGRect)frame imageStr:(NSString *)imageStr descStr:(NSString *)descStr;
- (void)NavBack;

@end

NS_ASSUME_NONNULL_END
