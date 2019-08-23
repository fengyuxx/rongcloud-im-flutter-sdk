//
//  RCImageMessage+WooPlus.m
//  WooPlus
//
//  Created by TeamN on 7/1/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "RCImageMessage+WooPlus.h"

@implementation RCImageMessage (WooPlus)

#pragma mark - MessageContentView
/*!
 返回在会话列表和本地通知中显示的消息内容摘要
 
 @return 会话列表和本地通知中显示的消息内容摘要
 
 @discussion 如果您使用IMKit，当会话的最后一条消息为自定义消息时，需要通过此方法获取在会话列表展现的内容摘要；
 当App在后台收到消息时，需要通过此方法获取在本地通知中展现的内容摘要。
 */
- (NSString *)conversationDigest{
    return [NSString stringWithFormat:@"[%@]", NSLocalizedString(@"Image", nil)];
}


@end
