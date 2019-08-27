//
//  WPRCVIPConversationStartCommand.m
//  WooPlus
//
//  Created by TeamN on 6/20/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCVIPConversationStartCommand.h"
#import "WPUserInfo.h"

@implementation WPRCVIPConversationStartCommand

- (NSMutableDictionary *)dictionayForEncode{
    NSMutableDictionary *dictionay = [super dictionayForEncode];
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
    self.user = [[WPUserInfo alloc] initWithDictionary:dictionary[@"user"]];
}

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
