//
//  UIView+AXExtension.h
//  AXKit
//
//  Created by xaoxuu on 05/03/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Foundation+CoreGraphics.h"

NS_ASSUME_NONNULL_BEGIN

/**
 创建一个指定高的view

 @param height 高度

 @return view
 */
CG_EXTERN UIView *UIViewWithHeight(CGFloat height);


@interface UIView (AXExtension)

/**
 当前view所在的控制器controller

 @return 控制器controller
 */
- (nullable UIViewController *)controller;


/**
 移除所有子视图

 @param subClass 指定范围（只移除属于哪个类的子视图，传入nil时移除所有子视图）
 */
- (void)ax_removeAllSubviews:(nullable Class)subClass;


/**
 让每个子视图执行一段代码

 @param subClass 指定范围（属于哪个类的子视图，传入nil时代表所有子视图）
 @param action   子视图所执行的代码块
 */
- (void)ax_eachSubview:(nullable Class)subClass action:(void (^)(__kindof UIView *subview))action;


/**
 让每个UILabel执行一段代码

 @param action 要执行的代码
 */
- (void)ax_eachLabelInvokeAction:(void (^)(__kindof UILabel *label))action;

/**
 让每个UITextField执行一段代码
 
 @param action 要执行的代码
 */
- (void)ax_eachTextFieldInvokeAction:(void (^)(__kindof UITextField *textField))action;

/**
 让每个UITextView执行一段代码
 
 @param action 要执行的代码
 */
- (void)ax_eachTextViewInvokeAction:(void (^)(__kindof UITextView *textView))action;

/**
 让每个UIButton执行一段代码
 
 @param action 要执行的代码
 */
- (void)ax_eachButtonInvokeAction:(void (^)(__kindof UIButton *button))action;

/**
 让每个UIImageView执行一段代码
 
 @param action 要执行的代码
 */
- (void)ax_eachImageViewInvokeAction:(void (^)(__kindof UIImageView *imageView))action;



/**
 让每个tag在指定范围的子视图执行一段代码

 @param tagRange 指定tag取值范围
 @param action 要执行的代码
 */
- (void)ax_eachSubviewWithTags:(AXIntegerRange)tagRange action:(void (^)(__kindof UIView *subview))action;

/**
 让每个tag等于某个值的子视图执行一段代码
 
 @param tag 指定tag值
 @param action 要执行的代码
 */
- (void)ax_eachSubviewWithTag:(NSInteger)tag action:(void (^)(__kindof UIView *subview))action;


/**
 圆角view

 @param rect 尺寸

 @return 圆角view
 */
+ (instancetype)ax_roundedViewWithFrame:(CGRect)rect;


@end

NS_ASSUME_NONNULL_END
