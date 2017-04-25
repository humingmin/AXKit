//
//  UIViewController+AXExtension.h
//  AXKit
//
//  Created by xaoxuu on 17/03/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIViewController (AXExtension)

/**
 push view controller

 @param vcName view controller name
 @param animated animated
 */
- (void)ax_pushViewControllerNamed:(NSString *)vcName animated:(BOOL)animated;

/**
 push view controller
 
 @param vcName view controller name
 @param animated animated
 @param completion completion
 */
- (void)ax_pushViewControllerNamed:(NSString *)vcName animated:(BOOL)animated completion:(void (^)(UIViewController *targetVC))completion;

/**
 push view controller
 
 @param vcName view controller name
 @param animated animated
 @param completion completion
 @param fail error info
 */
- (void)ax_pushViewControllerNamed:(NSString *)vcName animated:(BOOL)animated completion:(void (^)(UIViewController *targetVC))completion fail:(void (^)(NSError *error))fail;

@end
NS_ASSUME_NONNULL_END
