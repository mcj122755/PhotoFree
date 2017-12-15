//
//  MBProgressHUD+Tooltip.m
//  PhotoFree
//
//  Created by MCJ on 2017/12/12.
//  Copyright © 2017年 MCJ. All rights reserved.
//

#import "MBProgressHUD+Tooltip.h"
#import "AppDelegate.h"

@implementation MBProgressHUD (Tooltip)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view{
    MBProgressHUD *bud =[MBProgressHUD showHUDAddedTo:view animated:YES];
    bud.label.text = success;
    bud.mode  = MBProgressHUDModeText;
    bud.animationType = MBProgressHUDAnimationFade;
    [bud hideAnimated:YES afterDelay:1];
}

+ (void)showError:(NSString *)error toView:(UIView *)view{
    MBProgressHUD *bud =[MBProgressHUD showHUDAddedTo:view animated:YES];
    bud.label.text = error;
    bud.mode  = MBProgressHUDModeText;
    bud.animationType = MBProgressHUDAnimationFade;
    [bud hideAnimated:YES afterDelay:1];
}
@end
