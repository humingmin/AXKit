//
//  UIView+AXExtension.m
//  AXKit
//
//  Created by xaoxuu on 05/03/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "UIView+AXExtension.h"
#import "Foundation+CoreGraphics.h"
#import "UIViewController+AXExtension.h"

inline UIView *UIViewWithHeight(CGFloat height){
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, height)];
}


@implementation UIView (AXExtension)

// find view's super controller
- (UIViewController *)controller{
    UIResponder *responder = self;
    while ((responder = [responder nextResponder])){
        if ([responder isKindOfClass: [UIViewController class]])
            return (UIViewController *)responder;
    }
    return nil;
}

/*
- (nullable UIViewController *)rootVC{
    return self.controller.rootVC;
}
 */

- (void)ax_removeAllSubviews:(Class)subClass {
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
        if (!subClass || [subview isKindOfClass:subClass]) {
            [subview removeFromSuperview];
        }
    }];
}

- (void)ax_eachSubview:(Class)subClass action:(void (^)(__kindof UIView *subview))action {
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
        if (subview && action) {
            if (!subClass || [subview isKindOfClass:subClass]) {
                action(subview);
            }
        }
    }];
}

+ (instancetype)ax_roundedViewWithFrame:(CGRect)rect {
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 0.5 * fmin(rect.size.width, rect.size.height);
    return view;
}


@end

