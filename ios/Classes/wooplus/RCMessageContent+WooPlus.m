//
//  RCMessageContent+WooPlus.m
//  WooPlus
//
//  Created by TeamN on 6/29/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "RCMessageContent+WooPlus.h"

#import "WPRCGiftMessage.h"
#import "WPRCFeedbackMessage.h"
#import "WPRCGiftOpenNotification.h"
#import "WPRCGiftOpenCommand.h"
#import "WPRCVIPConversationStartCommand.h"

@implementation RCMessageContent (WooPlus)

+ (void)load{
    [super load];
}

- (BOOL)wp_isReadableMessage{
    return [[self class] persistentFlag] == MessagePersistent_ISCOUNTED;
}

- (NSString *)wp_conversationDigest{
    NSString *result = nil;
    if([self respondsToSelector:@selector(conversationDigest)]){
        result = [self conversationDigest];
    }else if([self respondsToSelector:@selector(content)]){
        result = [self performSelector:@selector(content)];
    }else{
        result = NSLocalizedStringFromTable([[self class] getObjectName], @"RongCloudKit", nil);
        if([result isEqualToString:[[self class] getObjectName]]) result = nil;
    }
    return [result stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
}

- (void)wp_setExtraJson:(NSDictionary *)extra{
    NSData *data = [NSJSONSerialization dataWithJSONObject:extra options:kNilOptions error:nil];
    [self wp_setExtra:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
    
}

- (void)wp_setExtra:(NSString *)extra{
    if([self respondsToSelector:@selector(setExtra:)]){
        [self performSelector:@selector(setExtra:) withObject:extra];
    }
}

- (NSString *)wp_extra{
    if([self respondsToSelector:@selector(extra)]){
        return [self performSelector:@selector(extra)];
    }else{
        return nil;
    }
}

- (NSDictionary *)wp_extraJson{
    NSString *extra = [self wp_extra];
    NSDictionary *dictionary = nil;
    if(extra){
        @try {
            dictionary = [NSJSONSerialization JSONObjectWithData:[extra dataUsingEncoding:NSUTF8StringEncoding]
                                                         options:kNilOptions error:nil];
        } @catch (NSException *exception) {
        } @finally {
        }
    }
    return dictionary;
}

- (NSUInteger)wp_version{
    return [[self wp_extraJson][@"ver"] integerValue];
    
}

@end
