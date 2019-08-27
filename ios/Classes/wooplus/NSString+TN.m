//
//  NSString+TN.m
//  WooPlus
//
//  Created by TeamN on 5/19/15.
//  Copyright (c) 2015 TeamN. All rights reserved.
//

#import "NSString+TN.h"

@implementation NSString (TN)
- (NSString *)stringUppercaseInRange:(NSRange)range{
    NSString *result = [self substringWithRange:range];
    result = [self stringByReplacingCharactersInRange:range withString:[result uppercaseString]];
    return result;
}

- (BOOL)containtWhitespaceOrNewline{
    NSArray *array = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return array.count > 1;
}

- (BOOL)isChinese{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (BOOL)includeChinese{
    for(int i=0; i< [self length];i++)
    {
        int a =[self characterAtIndex:i];
        if( a >0x4e00&& a <0x9fff){
            return YES;
        }
    }
    return NO;
}

- (NSDate *)stringToDate
{
    NSDateFormatter *inputFormatter= [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [inputFormatter dateFromString:self];
}

- (BOOL)containsStringCheck:(NSString *)str{
    if (str == nil || str.length == 0) {
        return NO;
    }
    return [self containsString:str];
}
@end
