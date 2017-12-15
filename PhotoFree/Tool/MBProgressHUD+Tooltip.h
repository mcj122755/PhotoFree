//
//  MBProgressHUD+Tooltip.h
//  PhotoFree
//
//  Created by MCJ on 2017/12/12.
//  Copyright © 2017年 MCJ. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Tooltip)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error toView:(UIView *)view;
@end
