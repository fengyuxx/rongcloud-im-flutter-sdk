//
//  WPRCMatchNotification.h
//  WooPlus
//
//  Created by TeamN on 6/23/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCStatusMessage.h"
@class WPUserInfo;

@interface WPRCMatchNotification : WPRCStatusMessage
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSArray<NSNumber *> *interestIds;
@property (nonatomic, strong) WPUserInfo *user;
@end
