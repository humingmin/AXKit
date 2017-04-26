//
//  NSString+AXExtension.h
//  AXKit
//
//  Created by xaoxuu on 05/03/2017.
//  Copyright © 2017 Titan Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Foundation+CoreGraphics.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark - get a string from ...

/**
 BOOL转字符串(0/1)
 
 @param x BOOL类型
 @return 字符串
 */
FOUNDATION_EXTERN NSString *NSStringFromBool(BOOL x);

/**
 CGFloat转字符串
 
 @param x CGFloat
 @return 字符串
 */
FOUNDATION_EXTERN NSString *NSStringFromFloat(float x);

/**
 CGFloat转字符串
 
 @param x CGFloat
 @return 字符串
 */
FOUNDATION_EXTERN NSString *NSStringFromCGFloat(CGFloat x);


/**
 int转字符串
 
 @param x int
 @return 字符串
 */
FOUNDATION_EXTERN NSString *NSStringFromInt(int x);

/**
 NSInteger转字符串
 
 @param x NSInteger
 @return 字符串
 */
FOUNDATION_EXTERN NSString *NSStringFromNSInteger(NSInteger x);

/**
 NSUInteger转字符串
 
 @param x NSUInteger
 @return 字符串
 */
FOUNDATION_EXTERN NSString *NSStringFromNSUInteger(NSUInteger x);



/**
 输出指针地址

 @param x id指针
 @return id指针的地址
 */
FOUNDATION_EXTERN NSString *NSStringFromPointer(id x);

/**
 输出百分比

 @param x 0~1
 @return 0% ~ 100%
 */
FOUNDATION_EXTERN NSString *NSStringFromPercent(CGFloat x);

typedef NS_ENUM(NSUInteger, AXRandomStringType){
    AXRandomName,
    AXRandomPassword,
    
    AXRandomLowerString,
    AXRandomUpperString,
    AXRandomCapitalizeString,
};


/**
 产生随机字符串

 @param type 随机类型
 @param length 长度范围
 @return 字符串
 */
FOUNDATION_EXTERN NSString *NSStringFromRandom(AXRandomStringType type, AXUIntegerRange length);

/**
 ASCIIValue转字符串
 
 @param ASCIIValue ASCII值
 @return 字符串
 */
FOUNDATION_EXTERN NSString *NSStringFromASCIIValue(unsigned char ASCIIValue);

@interface NSString (AXAppendExtension)

/**
 拼接字符串
 */
- (NSString *(^)(NSString *string))append;

/**
 拼接NSInteger
 */
- (NSString *(^)(NSInteger x))appendNSInteger;

/**
 拼接NSUInteger
 */
- (NSString *(^)(NSUInteger x))appendNSUInteger;

/**
 拼接CGFloat
 */
- (NSString *(^)(CGFloat x))appendCGFloat;

/**
 拼接换行符
 */
- (NSString *(^)())appendReturn;


@end


@interface NSString (AXRandomExtension)


/**
 产生指定长度的随机字符串（适用于用户名）

 @param length 长度范围（最小长度，最大长度）
 @return 随机字符串
 */
+ (NSString *)ax_stringWithRandomNameWithLength:(AXUIntegerRange)length;


/**
 产生指定长度的随机字符串（适用于密码）

 @param length 长度范围（最小长度，最大长度）
 @return 随机字符串
 */
+ (NSString *)ax_stringWithRandomPasswordWithLength:(AXUIntegerRange)length;


/**
 产生指定长度的随机字符串（纯小写）
 
 @param length 长度范围（最小长度，最大长度）
 @return 随机字符串
 */
+ (NSString *)ax_stringWithRandomLowerStringWithLength:(AXUIntegerRange)length;

/**
 产生指定长度的随机字符串（纯大写）
 
 @param length 长度范围（最小长度，最大长度）
 @return 随机字符串
 */
+ (NSString *)ax_stringWithRandomUpperStringWithLength:(AXUIntegerRange)length;

/**
 产生指定长度的随机字符串（首字母大写）
 
 @param length 长度范围（最小长度，最大长度）
 @return 随机字符串
 */
+ (NSString *)ax_stringWithRandomCapitalizeStringWithLength:(AXUIntegerRange)length;

@end


NS_ASSUME_NONNULL_END


