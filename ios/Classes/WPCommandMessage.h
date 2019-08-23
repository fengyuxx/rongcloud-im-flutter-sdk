//
//  WPCommandMessage.h
//  WooPlus
//
//  Created by yuanlin on 2017/10/9.
//  Copyright © 2017年 TeamN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPCommandMessageContent.h"

typedef NS_ENUM(NSInteger, WPCommandMessageType) {
    WPCommandMessageTypeUnMatch     = 0,
    WPCommandMessageTypeMatch       = 1,
    WPCommandMessageTypeRematch     = 2,
    WPCommandMessageTypeVIPStart    = 3,
    WPCommandMessageTypeUserKillOut = 4,
    WPCommandMessageTypeExtend      = 5,
};

@interface WPCommandMessage : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) WPCommandMessageType commandType;

@property (nonatomic, copy) NSString *targetId;

@property (nonatomic, copy) NSString *sendAt;

@property (nonatomic, assign) NSInteger direction;

@property (nonatomic, strong) WPCommandMessageContent *content;

+(instancetype)contentWithDataString:(NSString *)dataString;

@end
