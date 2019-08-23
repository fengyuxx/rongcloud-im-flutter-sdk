//
//  WPCommandMessage.m
//  WooPlus
//
//  Created by yuanlin on 2017/10/9.
//  Copyright © 2017年 TeamN. All rights reserved.
//

#import "WPCommandMessage.h"
#import "NSString+WooPlus.h"

@implementation WPCommandMessage

+(instancetype)contentWithDataString:(NSString *)dataString
{
    if (![dataString isKindOfClass:[NSString class]]) {
        return nil;
    }
    if ([dataString isBlankString]) {
        return nil;
    }
    NSError *error = nil;
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    if (error) {
        return nil;
    }
    
    WPCommandMessage *msg = [[WPCommandMessage alloc] init];

    if (dic[@"name"]) {
        NSString *name = dic[@"name"];
        if ([name isEqualToString:@"WP:ConversationUnmatch"]) {
            msg.commandType = WPCommandMessageTypeUnMatch;
        }
        if ([name isEqualToString:@"WP:MatchNtf"]) {
            msg.commandType = WPCommandMessageTypeMatch;
        }
        if ([name isEqualToString:@"WP:ConversationRematch"]) {
            msg.commandType = WPCommandMessageTypeRematch;
        }
        if ([name isEqualToString:@"WP:VIPConversationStartCommand"]) {
            msg.commandType = WPCommandMessageTypeVIPStart;
        }
        if ([name isEqualToString:@"WP:UserKickout"]) {
            msg.commandType = WPCommandMessageTypeUserKillOut;
        }
        if ([name isEqualToString:@"WP:ConversationExtend"]) {
            msg.commandType = WPCommandMessageTypeExtend;
        }
    }
    
    if (dic[@"target_id"]) {
        msg.targetId = dic[@"target_id"];
    }
    if (dic[@"direction"]) {
        msg.direction = [dic[@"direction"] integerValue];
    }
    if (dic[@"send_at"]) {
        msg.sendAt = dic[@"send_at"];
    }
    if (dic[@"content"]) {
        msg.content = [WPCommandMessageContent contentWithDataString:dic[@"content"]];
    }
    return msg;
}


-(instancetype)init
{
    if (self = [super init]) {
        self.content = [[WPCommandMessageContent alloc] init];
    }
    return self;
}
@end
