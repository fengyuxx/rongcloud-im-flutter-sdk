//
//  WPRCVIPConversationStartCommand.m
//  WooPlus
//
//  Created by TeamN on 6/20/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCVIPConversationStartCommand.h"

@implementation WPRCVIPConversationStartCommand


/*!
 返回消息的类型名
 
 @return 消息的类型名
 
 @discussion 您定义的消息类型名，需要在各个平台上保持一致，以保证消息互通。
 
 @warning 请勿使用@"RC:"开头的类型名，以免和SDK默认的消息名称冲突
 */
+ (NSString *)getObjectName{
    return @"WP:VIPConversationStartCommand";
}


#pragma mark - @protocol RCMessagePersistentCompatible <NSObject>

/*!
 返回消息的存储策略
 
 @return 消息的存储策略
 
 @discussion 指明此消息类型在本地是否存储、是否计入未读消息数。
 */
+ (RCMessagePersistent)persistentFlag{
    return MessagePersistent_NONE;
}

@end
