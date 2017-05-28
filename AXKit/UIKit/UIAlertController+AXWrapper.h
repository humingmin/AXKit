//
//  UIAlertController+AXWrapper.h
//  AXKit
//
//  Created by xaoxuu on 17/05/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// @xaoxuu: Cancel
FOUNDATION_EXTERN NSString *kStringCancel();

// @xaoxuu: OK
FOUNDATION_EXTERN NSString *kStringOK();
// @xaoxuu: Confirm
FOUNDATION_EXTERN NSString *kStringConfirm();

// @xaoxuu: Help
FOUNDATION_EXTERN NSString *kStringHelp();

// @xaoxuu: Error
FOUNDATION_EXTERN NSString *kStringError();

@interface UIAlertController (AXWrapper)

#pragma mark - 弹窗


/**
 弹窗(标题+消息+自定义按钮)（如果action为nil，则只有一个确定按钮）

 @param title 标题
 @param message 消息
 @param action action
 */
+ (void)ax_showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message action:(void (^ __nullable)(UIAlertController *alert))action;


/**
 弹出一个【取消+确定】两个按钮的弹窗（如果action为nil，则只有一个确定按钮）

 @param title 标题
 @param message 消息内容
 @param ok 确定按钮事件
 */
+ (void)ax_showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message ok:(void (^ __nullable)(UIAlertAction *sender))ok;


#pragma mark - 添加按钮

/**
 添加一个按钮

 @param title 按钮标题
 @param style 按钮样式
 @param handler 按钮事件
 */
- (void)ax_addActionWithTitle:(nullable NSString *)title style:(UIAlertActionStyle)style handler:(void (^ __nullable)(UIAlertAction *sender))handler;


/**
 添加一个取消样式的按钮(标题传nil则为默认标题)

 @param title 按钮标题
 @param handler 按钮事件
 */
- (void)ax_addCancelActionWithTitle:(nullable NSString *)title handler:(void (^ __nullable)(UIAlertAction *sender))handler;
- (void)ax_addCancelAction;

/**
 添加一个默认样式的按钮(标题传nil则为默认标题)
 
 @param title 按钮标题
 @param handler 按钮事件
 */
- (void)ax_addDefaultActionWithTitle:(nullable NSString *)title handler:(void (^ __nullable)(UIAlertAction *sender))handler;


/**
 添加一个破坏性按钮（红色）(标题传nil则为默认标题)
 
 @param title 按钮标题
 @param handler 按钮事件
 */
- (void)ax_addDestructiveActionWithTitle:(nullable NSString *)title handler:(void (^ __nullable)(UIAlertAction *sender))handler;


@end

NS_ASSUME_NONNULL_END
