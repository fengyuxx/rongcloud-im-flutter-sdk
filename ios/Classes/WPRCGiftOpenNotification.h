//
//  WPRCGiftOpenNtf.h
//  WooPlus
//
//  Created by TeamN on 6/3/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCMessageContent.h"

@interface WPRCGiftOpenNotification : WPRCMessageContent
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *giftId;
@property (nonatomic, strong) NSString *giftName;
@property (nonatomic, readonly) NSAttributedString *attributedString;
@end
