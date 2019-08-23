//
//  RCMessage+WooPlus.m
//  WooPlus
//
//  Created by TeamN on 6/21/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "RCMessage+WooPlus.h"
#import "RCMessageContent+WooPlus.h"

@implementation RCMessage (WooPlus)
static RCMessage *_tn_null;
+ (RCMessage *)tn_null{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tn_null = [[RCMessage alloc] init];
    });
    return _tn_null;
}

- (NSString *)wp_description{
    NSString *direction = (self.messageDirection == MessageDirection_SEND ? @"s" : @"r");
    NSString *objectName = [[self.content class] getObjectName];
    NSDate *timestamp = (self.messageDirection == MessageDirection_SEND ? self.wp_sentTime : self.wp_receivedTime);
    return [NSString stringWithFormat:@"%@ %@:%@ %@", self.targetId, direction, objectName, timestamp];
}

- (NSDictionary *)wp_serialization{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:self.senderUserId forKey:@"fromUserId"];
    [dict setObject:self.targetId forKey:@"targetId"];
    [dict setObject:@(self.conversationType) forKey:@"targetType"];
    [dict setObject:[[self.content class] getObjectName] forKey:@"classname"];
    NSDictionary *content = [NSJSONSerialization JSONObjectWithData:[self.content encode] options:0 error:nil];
    [dict setObject:content forKey:@"content"];
    [dict setObject:@(self.sentTime) forKey:@"created_at"];
    if(self.messageUId) [dict setObject:self.messageUId forKey:@"msgUID"];
    return dict;
}

- (BOOL)wp_shouldSerialization{
    id<RCMessagePersistentCompatible> compatible = self.content;
    RCMessagePersistent flag = [[compatible class] persistentFlag];
    BOOL result = (flag != MessagePersistent_NONE && flag != MessagePersistent_STATUS);
    return result;
}

- (NSDate *)wp_receivedTime{
    if(self.receivedTime == 0) return nil;
    return [NSDate dateWithTimeIntervalSince1970:(self.receivedTime / 1000.0f)];
}
- (NSDate *)wp_sentTime{
    if(self.sentTime == 0) return nil;
    return [NSDate dateWithTimeIntervalSince1970:(self.sentTime / 1000)];
}

- (BOOL)wp_isMessageSentAfter:(RCMessage *)message{
    return ([self.wp_sentTime timeIntervalSinceDate:message.wp_sentTime] < 0);
}
- (BOOL)wp_unread{
    return self.content.wp_isReadableMessage && self.receivedStatus == ReceivedStatus_UNREAD;
}
@end
