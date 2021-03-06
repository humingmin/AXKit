//
//  AXKitHelpServices.m
//  AXKit
//
//  Created by xaoxuu on 17/05/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "_AXKitHelpServices.h"
#import "NSError+AXExtension.h"
#import "UIAlertController+AXWrapper.h"
#import "UIResponder+AXExtension.h"

NSErrorDomain const AXKitErrorDomain = @"com.xaoxuu.axkit.error";


static NSString const *AXKitIssuesURLStr = @"https://github.com/xaoxuu/AXKit/issues";



@implementation AXKitHelpServices

+ (NSURL *)errorURLWithCode:(AXKitErrorCode)code{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",AXKitIssuesURLStr,@(code)]];
}

@end

@implementation NSError (AXKitHelpExtension)


+ (instancetype)axkit_errorWithCode:(NSInteger)code reason:(nullable NSString *(^)())reason{
    NSError *error = [self ax_errorWithMaker:^(NSErrorMaker * _Nonnull error) {
        error.domain = AXKitErrorDomain;
        error.code = code;
        error.localizedFailureReason = reason?reason():@"";
    }];
    NSString *msg = nil;
    if (reason) {
        msg = reason();
    }
    [UIAlertController ax_showAlertWithTitle:kStringError() message:msg action:^(UIAlertController * _Nonnull alert) {
        [alert ax_addCancelAction];
        [alert ax_addDefaultActionWithTitle:kStringHelp() handler:^(UIAlertAction * _Nonnull sender) {
            [[UIApplication sharedApplication] openURL:[AXKitHelpServices errorURLWithCode:code] options:@{} completionHandler:^(BOOL success) {
                
            }];
        }];
    }];
    
    return error;
}

@end
