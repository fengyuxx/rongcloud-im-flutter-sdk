//
//  NSString+WooPlus.m
//  WooPlus
//
//  Created by TeamN on 11/17/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "NSString+WooPlus.h"

@implementation NSString (WooPlus)
- (NSString *)stringByReplacingTextWithCurrentAppName:(NSString *)text{
    if(text.length == 0) return self;
    NSString *appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    if (appName.length == 0 || appName == nil) {
        return self;
    } else {
        return [self stringByReplacingOccurrencesOfString:text
                                               withString:appName
                                                  options:NSCaseInsensitiveSearch
                                                    range:NSMakeRange(0, self.length)];
    }
}

- (BOOL)isBlankString{
    if (self == nil || self == NULL) {
        return YES;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
    
}


@end
