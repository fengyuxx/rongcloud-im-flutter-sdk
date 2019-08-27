//
//  WPRCVIPConversationStartCommand.h
//  WooPlus
//
//  Created by TeamN on 6/20/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCStatusMessage.h"
@class WPUserInfo;

@interface WPRCVIPConversationStartCommand : WPRCStatusMessage
@property (nonatomic, strong) WPUserInfo *user;
@end
