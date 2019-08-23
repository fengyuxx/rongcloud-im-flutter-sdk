//
//  WPRCGiftOpenCommand.m
//  WooPlus
//
//  Created by TeamN on 6/12/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCGiftOpenCommand.h"
#import "NSString+TN.h"

@implementation WPRCGiftOpenCommand
- (void)setGender:(Gender)gender{
    _gender = gender;
    
    NSString *text = NSLocalizedString(@"Notice_gift_opened", nil);
    NSString *pronoun;
    if(gender == GenderMale){
        pronoun = NSLocalizedString(@"he", nil);
    }else{
        pronoun = NSLocalizedString(@"she", nil);
    }
    text = [text stringByReplacingOccurrencesOfString:@"$PRONOUN" withString:pronoun];
    self.message = [text stringUppercaseInRange:NSMakeRange(0, 1)];
}


/*!
 返回消息的类型名
 
 @return 消息的类型名
 
 @discussion 您定义的消息类型名，需要在各个平台上保持一致，以保证消息互通。
 
 @warning 请勿使用@"RC:"开头的类型名，以免和SDK默认的消息名称冲突
 */
+ (NSString *)getObjectName{
    return @"WP:GiftOpenCommand";
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


#pragma mark - @protocol RCMessageContentView

/*!
 返回在会话列表和本地通知中显示的消息内容摘要
 
 @return 会话列表和本地通知中显示的消息内容摘要
 
 @discussion 如果您使用IMKit，当会话的最后一条消息为自定义消息时，需要通过此方法获取在会话列表展现的内容摘要；
 当App在后台收到消息时，需要通过此方法获取在本地通知中展现的内容摘要。
 */
- (NSString *)conversationDigest{
    return nil;
}

@end
