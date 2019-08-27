//
//  NSString+WooPlus.h
//  WooPlus
//
//  Created by TeamN on 11/17/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WooPlus)
- (NSString *)stringByReplacingTextWithCurrentAppName:(NSString *)text;

- (BOOL)isBlankString;
@end
