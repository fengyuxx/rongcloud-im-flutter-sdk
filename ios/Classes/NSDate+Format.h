//
//  NSDate+Format.h
//
//  Created by TeamN on 18-9-21.
//  Copyright (c) 2018年 TeamN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Format)
+ (NSDate *)tn_dateFromString:(NSString *)string withFormat:(NSString *)format;
- (NSString *)tn_stringWithFormat:(NSString *)format;
@end
