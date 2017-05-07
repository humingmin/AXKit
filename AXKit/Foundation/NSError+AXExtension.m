//
//  NSError+AXExtension.m
//  AXKit
//
//  Created by xaoxuu on 25/04/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import "NSError+AXExtension.h"

NSString *AXKitErrorDomain = @"com.xaoxuu.axkit.error";

@implementation NSError (AXExtension)

+ (instancetype)ax_errorWithDomain:(NSErrorDomain)domain
                              code:(NSInteger)code
                       description:(nullable NSString *(^)())description
                            reason:(nullable NSString *(^)())reason
                        suggestion:(nullable NSString *(^)())suggestion{
    return [[self alloc] ax_initWithDomain:domain code:code description:description reason:reason suggestion:suggestion];
}


- (instancetype)ax_initWithDomain:(NSErrorDomain)domain
                             code:(NSInteger)code
                      description:(nullable NSString *(^)())description
                           reason:(nullable NSString *(^)())reason
                       suggestion:(nullable NSString *(^)())suggestion{
    NSString *desc = description();
    NSString *reas = reason();
    NSString *sugg = suggestion();
    desc = desc ? : ERROR_DEFAULT_DESCRIPTION;
    reas = reas.length?reas:ERROR_DEFAULT_REASON;
    sugg  = sugg  ? : ERROR_DEFAULT_SUGGESTION;
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey:NSLocalizedString(desc, nil),
                               NSLocalizedFailureReasonErrorKey:NSLocalizedString(reas, nil),
                               NSLocalizedRecoverySuggestionErrorKey:NSLocalizedString(sugg, nil),
                               };
    NSError *error = [NSError errorWithDomain:domain code:code userInfo:userInfo];
    return error;
}

@end
