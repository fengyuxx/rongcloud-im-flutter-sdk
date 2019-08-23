//
//  WPRCStatusMessage.m
//  WooPlus
//
//  Created by TeamN on 16/03/2017.
//  Copyright © 2017 TeamN. All rights reserved.
//

#import "WPRCStatusMessage.h"

@implementation WPRCStatusMessage

#pragma mark - @protocol RCMessageCoding <NSObject>
/*!
 将消息内容序列化，编码成为可传输的json数据
 
 @discussion
 消息内容通过此方法，将消息中的所有数据，编码成为json数据，返回的json数据将用于网络传输。
 */
- (NSMutableDictionary *)dictionayForEncode{
    NSData *data = [super encode];
    NSMutableDictionary *dictionay = nil;
    @try {
        dictionay = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    } @catch (NSException *exception) {
    } @finally {
    }
    if(dictionay == nil){
        dictionay = [NSMutableDictionary dictionary];
    }
    if(self.extra) [dictionay setObject:self.extra forKey:@"extra"];
    return dictionay;
}

- (NSData *)encode{
    NSMutableDictionary *dictionay = [self dictionayForEncode];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionay
                                           options:kNilOptions
                                             error:nil];
    return data;
}

/*!
 将json数据的内容反序列化，解码生成可用的消息内容
 
 @param data    消息中的原始json数据
 
 @discussion 网络传输的json数据，会通过此方法解码，获取消息内容中的所有数据，生成有效的消息内容。
 */
- (void)decodeWithData:(NSData *)data{
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    self.extra = dictionary[@"extra"];
}

@end
