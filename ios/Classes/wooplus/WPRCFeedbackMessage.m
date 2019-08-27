//
//  WPRCFeedbackMessage.m
//  WooPlus
//
//  Created by TeamN on 6/27/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCFeedbackMessage.h"
#import "NSDate+Format.h"

@interface WPRCFeedbackMessage ()
@end

@implementation WPRCFeedbackMessage

#pragma mark - @protocol RCMessageCoding <NSObject>

- (NSMutableDictionary *)dictionayForEncode{
    NSMutableDictionary *dictionay = [super dictionayForEncode];
    [dictionay setObject:self.feedbackId forKey:@"feedback_id"];
    [dictionay setObject:@([self.createdAt timeIntervalSince1970]) forKey:@"created_at"];
    [dictionay setObject:self.body forKey:@"content"]; //body保存content的模板。
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
    self.feedbackId = dictionary[@"feedback_id"];
    NSTimeInterval interval = [dictionary[@"created_at"] doubleValue];
    self.createdAt = [NSDate dateWithTimeIntervalSince1970:interval];
    self.body = dictionary[@"content"];
    NSString *time = [self.createdAt tn_stringWithFormat:@"EEE, MMM dd"];
    NSString *text = self.body;
    if([text containsString:@"#TIME#"] && time){
        text = [text stringByReplacingOccurrencesOfString:@"#TIME#" withString:time];//替换body中的模板
    }
    if([text containsString:@"%TIME%"] && time){
        text = [text stringByReplacingOccurrencesOfString:@"%TIME%" withString:time];//替换body中的模板
    }
    self.content = text;
}

/*!
 返回消息的类型名
 
 @return 消息的类型名
 
 @discussion 您定义的消息类型名，需要在各个平台上保持一致，以保证消息互通。
 
 @warning 请勿使用@"RC:"开头的类型名，以免和SDK默认的消息名称冲突
 */
+ (NSString *)getObjectName{
    return @"WP:Feedback";
}

#pragma mark - MessageContentView
/*!
 返回在会话列表和本地通知中显示的消息内容摘要
 
 @return 会话列表和本地通知中显示的消息内容摘要
 
 @discussion 如果您使用IMKit，当会话的最后一条消息为自定义消息时，需要通过此方法获取在会话列表展现的内容摘要；
 当App在后台收到消息时，需要通过此方法获取在本地通知中展现的内容摘要。
 */
- (NSString *)conversationDigest{
    return [self.content stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
}



@end
