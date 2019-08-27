//
//  WPRCGiftMessageContent.m
//  WooPlus
//
//  Created by TeamN on 6/1/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCGiftMessage.h"
#import "WPUserInfo.h"

@implementation WPRCGiftMessage

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - MessageCoding <NSObject>
/**
 编码将当前对象转成JSON数据
 @return 编码后的JSON数据
 */
- (NSMutableDictionary *)dictionayForEncode{
    NSMutableDictionary *dictionay = [super dictionayForEncode];
    
    NSMutableDictionary *gift = [NSMutableDictionary dictionary];
    if(self.commodity){
        if(self.commodity.commodityId) [gift setObject:self.commodity.commodityId forKey:@"id"];
        if(self.commodity.name) [gift setObject:self.commodity.name forKey:@"name"];
        if(self.commodity.URL) [gift setObject:[self.commodity.URL absoluteString] forKey:@"url"];
        [gift setObject:@(self.commodity.price) forKey:@"price"];
        
        if(self.giftId) [dictionay setObject:self.giftId forKey:@"giftId"];
        if(self.content) [dictionay setObject:self.content forKey:@"content"];
        [dictionay setObject:@(self.opened ? 1 : 0) forKey:@"opened"];
        [dictionay setObject:gift forKey:@"gift"];
    }
    
    if(self.user){
        [dictionay setObject:[self.user dictionary] forKey:@"user"];
    }
    return dictionay;
}
/**
 根据给定的JSON数据设置当前实例
 @param data 传入的JSON数据
 */
- (void)decodeWithData:(NSData *)data{
    [super decodeWithData:data];
    
    if (data == nil) return;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:nil];
    if(dictionary == nil) return;
    
    self.giftId = dictionary[@"giftId"];
    self.content = dictionary[@"content"];
    self.opened = [dictionary[@"opened"] boolValue];
    
    NSDictionary *gift = dictionary[@"gift"];
    if(gift == nil) return;
    if(gift[@"id"] == nil || gift[@"name"] == nil || gift[@"url"] == nil) return;
    
    self.commodity = [[WPRCGiftCommodity alloc] init];
    self.commodity.commodityId = gift[@"id"];
    self.commodity.name = gift[@"name"];
    self.commodity.URL = [NSURL URLWithString:gift[@"url"]];
    self.commodity.price = [gift[@"price"] floatValue];
    
    //老版本没有dictionary[@"giftId"]字段，gift[@"id"]非commodityId而是giftId
    if(self.giftId == nil && self.commodity.commodityId != nil){
        self.giftId = self.commodity.commodityId;
        self.commodity.commodityId = nil;
    }else if(self.giftId != nil && [self.giftId isEqualToString:self.commodity.commodityId]){
        self.commodity.commodityId = nil;
    }
    
    self.user = [[WPUserInfo alloc] initWithDictionary:dictionary[@"user"]];
}

/**
 应返回消息名称，此字段需个平台保持一致
 @return 消息体名称
 */
+ (NSString *)getObjectName{
    return @"WP:GiftMsg";
}

#pragma mark - MessageContentView
/*!
 返回在会话列表和本地通知中显示的消息内容摘要
 
 @return 会话列表和本地通知中显示的消息内容摘要
 
 @discussion 如果您使用IMKit，当会话的最后一条消息为自定义消息时，需要通过此方法获取在会话列表展现的内容摘要；
 当App在后台收到消息时，需要通过此方法获取在本地通知中展现的内容摘要。
 */
- (NSString *)conversationDigest{
    if(self.opened){
        return NSLocalizedString(@"system message", nil);
    }else{
        return [NSString stringWithFormat:@"[%@]", NSLocalizedString(@"Gift", nil)];
    }
}

@end


@implementation WPRCGiftCommodity

@end
