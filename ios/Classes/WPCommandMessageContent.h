//
//  WPCommandMessageContent.h
//  WooPlus
//
//  Created by yuanlin on 2017/10/9.
//  Copyright © 2017年 TeamN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPCommandMessageContent : NSObject

@property (nonatomic, strong) NSDate *createdAt;

@property (nonatomic, assign) NSInteger age;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, strong) NSArray<NSNumber *> *interest;

@property (nonatomic, copy) NSString *reason;

+(instancetype)contentWithDataString:(NSString *)dataString;
@end
