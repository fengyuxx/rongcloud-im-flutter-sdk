//
//  WPCommandMessageContent.m
//  WooPlus
//
//  Created by yuanlin on 2017/10/9.
//  Copyright © 2017年 TeamN. All rights reserved.
//

#import "WPCommandMessageContent.h"
#import "NSString+WooPlus.h"

@implementation WPCommandMessageContent

+(instancetype)contentWithDataString:(NSString *)dataString
{
    NSDictionary *dic;
    if ([dataString isKindOfClass:[NSString class]]) {
        if ([dataString isBlankString]) {
            return nil;
        }
        NSError *error = nil;
        NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
        dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        if (error) {
            return nil;
        }
    }
    else if ([dataString isKindOfClass:[NSDictionary class]]) {
        dic = (NSDictionary *)dataString;
    }
    else {
        return nil;
    }
    
    WPCommandMessageContent *content = [[WPCommandMessageContent alloc] init];
    if (dic[@"created_at"]) {
        long long time = [dic[@"created_at"] longLongValue];
        if (time == 0) {
            content.createdAt = nil;
        } else {
            content.createdAt = [NSDate dateWithTimeIntervalSince1970:time];
        }
    }
    if (dic[@"age"]) {
        content.age = [dic[@"age"] integerValue];
    }
    if (dic[@"address"]) {
        content.address = dic[@"address"];
    }
    if (dic[@"reason"]) {
        content.reason = dic[@"reason"];
    }
    if (dic[@"interest"]) {
        content.interest = dic[@"interest"];
    }
    return content;
}

@end
