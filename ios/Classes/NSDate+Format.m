//
//  NSDate+Format.m
//
//  Created by TeamN on 18-9-21.
//  Copyright (c) 2018年 TeamN. All rights reserved.
//

#import "NSDate+Format.h"

@implementation NSDate (Format)

+ (NSDate *)tn_dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    @try {
        string = [NSString stringWithFormat:@"%@", string];
        return [formatter dateFromString:[string substringWithRange:NSMakeRange(0, MIN(string.length, format.length))]];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

- (NSString *)tn_stringWithFormat:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    @try {
        return [formatter stringFromDate:self];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

@end
