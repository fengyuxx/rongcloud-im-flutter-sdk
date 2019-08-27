//
//  WPRCMatchNotification.m
//  WooPlus
//
//  Created by TeamN on 6/23/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCMatchNotification.h"
#import "NSDate+Format.h"
#import "WPUserInfo.h"

@implementation WPRCMatchNotification

#pragma mark - @protocol RCMessageCoding <NSObject>

- (NSMutableDictionary *)dictionayForEncode{
    NSMutableDictionary *dictionay = [super dictionayForEncode];
    [dictionay setObject:@([self.createdAt timeIntervalSince1970]) forKey:@"created_at"];
    [dictionay setObject:self.interestIds forKey:@"interest"];
    [dictionay setObject:self.address forKey:@"address"];
    [dictionay setObject:@(self.age) forKey:@"age"];
    if(self.user){
        [dictionay setObject:[self.user dictionary] forKey:@"user"];
    }
    return dictionay;
}

/*!
 将json数据的内容反序列化，解码生成可用的消息内容
 
 @param data    消息中的原始json数据
 
 @discussion 网络传输的json数据，会通过此方法解码，获取消息内容中的所有数据，生成有效的消息内容。
 */
- (void)decodeWithData:(NSData *)data{
    [super decodeWithData:data];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    double t = [dictionary[@"created_at"] doubleValue] / 1000;
    self.createdAt = [NSDate dateWithTimeIntervalSince1970:t];
    self.interestIds = dictionary[@"interest"];
    self.address = dictionary[@"address"];
    self.age = [dictionary[@"age"] integerValue];
    
    self.user = [[WPUserInfo alloc] initWithDictionary:dictionary[@"user"]];
}

/*!
 返回消息的类型名
 
 @return 消息的类型名
 
 @discussion 您定义的消息类型名，需要在各个平台上保持一致，以保证消息互通。
 
 @warning 请勿使用@"RC:"开头的类型名，以免和SDK默认的消息名称冲突
 */
+ (NSString *)getObjectName{
    return @"WP:MatchNtf";
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

#pragma mark - MessageContentView
/*!
 返回在会话列表和本地通知中显示的消息内容摘要
 
 @return 会话列表和本地通知中显示的消息内容摘要
 
 @discussion 如果您使用IMKit，当会话的最后一条消息为自定义消息时，需要通过此方法获取在会话列表展现的内容摘要；
 当App在后台收到消息时，需要通过此方法获取在本地通知中展现的内容摘要。
 */
- (NSString *)conversationDigest{
    NSString *timestamp = [self.createdAt tn_stringWithFormat:@"MMMM d"];
    NSString *detail = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"Matched_on", nil),
                        timestamp];
    return detail;
}

@end
