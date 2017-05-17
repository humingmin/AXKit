//
//  AXKitHelpServices.m
//  AXKit
//
//  Created by xaoxuu on 17/05/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "AXKitHelpServices.h"
#import "NSError+AXExtension.h"
#import "UIAlertController+AXWrapper.h"
#import "UIResponder+AXExtension.h"

NSErrorDomain const AXKitErrorDomain = @"com.xaoxuu.axkit.error";


static NSString const *AXKitIssuesURLStr = @"https://github.com/xaoxuu/AXKit/issues";



@implementation AXKitHelpServices

+ (NSURL *)errorURLWithCode:(AXKitErrorCode)code{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",AXKitIssuesURLStr,[NSNumber numberWithUnsignedInteger:code]]];
}

@end

@implementation NSError (AXKitHelpExtension)


+ (instancetype)axkit_errorWithCode:(NSInteger)code reason:(nullable NSString *(^)())reason{
    NSError *error = [self ax_errorWithDomain:^NSErrorDomain _Nonnull{
        return AXKitErrorDomain;
    } code:code description:nil reason:reason suggestion:nil];
    
    NSString *msg = nil;
    if (reason) {
        msg = reason();
    }
    
    [UIAlertController ax_showAlertWithTitle:NSLocalizedString(@"Error", nil) message:msg cancelButtonTitle:NSLocalizedString(@"cancel", nil) okButtonTitle:NSLocalizedString(@"help", nil) okButtonHandler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[AXKitHelpServices errorURLWithCode:code] options:@{} completionHandler:^(BOOL success) {
            
        }];
    }];
    return error;
}

@end
