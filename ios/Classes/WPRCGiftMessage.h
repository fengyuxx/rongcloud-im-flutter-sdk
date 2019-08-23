//
//  WPRCGiftMessageContent.h
//  WooPlus
//
//  Created by TeamN on 6/1/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCMessageContent.h"
@class WPRCGiftCommodity;

@interface WPRCGiftMessage : WPRCMessageContent
@property (nonatomic, strong) NSString *giftId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) WPRCGiftCommodity *commodity;
@property (nonatomic, assign) BOOL opened;
@end


@interface WPRCGiftCommodity : NSObject
@property (nonatomic, strong) NSString *commodityId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, strong) NSURL *URL;
@end
