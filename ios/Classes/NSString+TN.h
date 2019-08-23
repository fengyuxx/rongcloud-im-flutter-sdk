//
//  NSString+TN.h
//  WooPlus
//
//  Created by TeamN on 5/19/15.
//  Copyright (c) 2015 TeamN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TN)

- (NSString *)stringUppercaseInRange:(NSRange)range;
- (BOOL)containtWhitespaceOrNewline;
- (BOOL)isChinese;//判断是否是纯汉字
- (BOOL)includeChinese;//判断是否含有汉字
- (NSDate *)stringToDate;
- (BOOL)containsStringCheck:(NSString *)str;
@end
