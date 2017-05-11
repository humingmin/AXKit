//
//  AlertServices.m
//  AXKit
//
//  Created by xaoxuu on 10/05/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "AlertServices.h"
#import <SCLAlertView-Objective-C/SCLAlertView.h>
#import "SCLAlertView+AXWrapper.h"
#import "AppDelegate.h"


@interface AlertServices ()

// @xaoxuu: alert
@property (strong, nonatomic) SCLAlertView *alert;

@end

@implementation AlertServices


- (instancetype)init{
    if (self = [super init]) {
        
        
    }
    return self;
}




- (void)showTips:(NSString *)msg{
    [SCLAlertView ax_showError:self.rootVC title:NSLocalizedString(@"提示", nil) subTitle:msg closeButtonTitle:NSLocalizedString(@"确定", nil) duration:0];
}

- (void)showWaiting:(NSString *)msg{
    [SCLAlertView ax_showWaiting:self.rootVC title:NSLocalizedString(@"请稍等", nil) subTitle:msg closeButtonTitle:nil duration:0];
}







- (void)alertFotConfirmWithMessage:(NSString *)msg confirm:(void (^)())confirm{
    SCLAlertView *alert = [SCLAlertView ax_SCLAlertViewWithDefaultColor];
    [alert addButton:NSLocalizedString(@"确认", nil) actionBlock:^{
        confirm();
    }];
    [alert showQuestion:self.rootVC title:NSLocalizedString(@"提示", nil) subTitle:msg closeButtonTitle:NSLocalizedString(@"取消", nil) duration:0];
    
}


- (void)alertForConfirmTheme:(UIColor *)color message:(NSString *)msg completion:(void (^)())completion{
    SCLAlertView *alert = [SCLAlertView ax_SCLAlertViewWithDefaultColor];
    self.alert = alert;
    alert.customViewColor = color;
    [alert addButton:NSLocalizedString(@"确认", nil) actionBlock:^{
        if (completion) {
            completion();
            [NSBlockOperation ax_delay:1 performInMainQueue:^{
                [AXProgressHUD ax_target:self.rootVC.view showInfo:@"已应用主题" duration:3];
            }];
        }
    }];
    [alert showCustom:self.rootVC image:[UIImage imageNamed:@"alert_theme"] color:axColor.theme title:NSLocalizedString(@"提示", nil) subTitle:msg closeButtonTitle:NSLocalizedString(@"取消", nil) duration:0];
}

- (void)hideAlertView{
    [SCLAlertView ax_hide];
}

#pragma mark - private

- (UIViewController *)rootVC{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return appDelegate.window.rootViewController;
}


@end
