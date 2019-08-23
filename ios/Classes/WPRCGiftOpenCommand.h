//
//  WPRCGiftOpenCommand.h
//  WooPlus
//
//  Created by TeamN on 6/12/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCGiftOpenNotification.h"
#import "Gender.h"

@interface WPRCGiftOpenCommand : WPRCGiftOpenNotification
@property (nonatomic, assign) Gender gender;
@end
