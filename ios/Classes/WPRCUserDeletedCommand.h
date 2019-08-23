//
//  WPRCUserDeletedCommand.h
//  WooPlus
//
//  Created by TeamN on 6/24/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCStatusMessage.h"

@interface WPRCUserDeletedCommand : WPRCStatusMessage
@property (nonatomic, strong) NSString *targetId;
@end
