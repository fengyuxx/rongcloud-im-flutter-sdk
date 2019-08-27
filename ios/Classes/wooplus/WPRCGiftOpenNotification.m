//
//  WPRCGiftOpenNtf.m
//  WooPlus
//
//  Created by TeamN on 6/3/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCGiftOpenNotification.h"

@implementation WPRCGiftOpenNotification


#pragma mark - @protocol RCMessageCoding <NSObject>
/*!
 将消息内容序列化，编码成为可传输的json数据
 
 @discussion 消息内容通过此方法，将消息中的所有数据，编码成为json数据，返回的json数据将用于网络传输。
 */

- (NSMutableDictionary *)dictionayForEncode{
    NSMutableDictionary *dictionay = [super dictionayForEncode];
    [dictionay setObject:self.giftId forKey:@"gift_id"];
    if(self.giftName){
        [dictionay setObject:self.giftName forKey:@"gift_name"];
    }
    [dictionay setObject:self.message forKey:@"message"];
    return dictionay;
}

/*!
 将json数据的内容反序列化，解码生成可用的消息内容
 
 @param data    消息中的原始json数据
 
 @discussion 网络传输的json数据，会通过此方法解码，获取消息内容中的所有数据，生成有效的消息内容。
 */
- (void)decodeWithData:(NSData *)data{
    [super decodeWithData:data];
    
    if (data == nil) return;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                              options:kNilOptions
                                                                error:nil];
    if(dictionary == nil) return;
    if(dictionary[@"gift_id"] == nil) return;
    
    self.giftId = dictionary[@"gift_id"];
    self.giftName = dictionary[@"gift_name"];
    self.message = dictionary[@"message"];
    self.extra = dictionary[@"extra"];
}

/*!
 返回消息的类型名
 
 @return 消息的类型名
 
 @discussion 您定义的消息类型名，需要在各个平台上保持一致，以保证消息互通。
 
 @warning 请勿使用@"RC:"开头的类型名，以免和SDK默认的消息名称冲突
 */
+ (NSString *)getObjectName{
    return @"WP:GiftOpenNotification";
}


#pragma mark - @protocol RCMessagePersistentCompatible <NSObject>

/*!
 返回消息的存储策略
 
 @return 消息的存储策略
 
 @discussion 指明此消息类型在本地是否存储、是否计入未读消息数。
 */
+ (RCMessagePersistent)persistentFlag{
    return MessagePersistent_ISCOUNTED;
}

- (BOOL)wp_isReadableMessage{
    return NO;
}

#pragma mark - @protocol RCMessageContentView

/*!
 返回在会话列表和本地通知中显示的消息内容摘要
 
 @return 会话列表和本地通知中显示的消息内容摘要
 
 @discussion 如果您使用IMKit，当会话的最后一条消息为自定义消息时，需要通过此方法获取在会话列表展现的内容摘要；
 当App在后台收到消息时，需要通过此方法获取在本地通知中展现的内容摘要。
 */
- (NSString *)conversationDigest{
    return self.message;
}

@end
