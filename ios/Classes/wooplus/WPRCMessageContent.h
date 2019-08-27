//
//  WPRCMessageContent.h
//  WooPlus
//
//  Created by TeamN on 16/03/2017.
//  Copyright © 2017 TeamN. All rights reserved.
//

#import <RongIMLib/RongIMLib.h>

@interface WPRCMessageContent : RCMessageContent
@property (nonatomic, strong) NSString *extra;
- (NSMutableDictionary *)dictionayForEncode;
@end
