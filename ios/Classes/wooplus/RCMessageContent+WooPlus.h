//
//  RCMessageContent+WooPlus.h
//  WooPlus
//
//  Created by TeamN on 6/29/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import <RongIMLib/RongIMLib.h>

@interface RCMessageContent (WooPlus)
- (BOOL)wp_isReadableMessage;
- (NSString *)wp_conversationDigest;


- (void)wp_setExtraJson:(NSDictionary *)extra;
- (void)wp_setExtra:(NSString *)extra;
- (NSString *)wp_extra;
- (NSDictionary *)wp_extraJson;
- (NSUInteger)wp_version;
@end
