//
//  RCMessage+WooPlus.h
//  WooPlus
//
//  Created by TeamN on 6/21/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import <RongIMLib/RongIMLib.h>

@interface RCMessage (WooPlus)
+ (RCMessage *)tn_null;
- (NSString *)wp_description;
- (NSDictionary *)wp_serialization;
- (BOOL)wp_shouldSerialization;
- (NSDate *)wp_receivedTime;
- (NSDate *)wp_sentTime;
- (BOOL)wp_isMessageSentAfter:(RCMessage *)message;
- (BOOL)wp_unread;
@end
