//
//  WPUserInfo.h
//  Runner
//
//  Created by Elvin Gao on 2019/8/27.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WPUserInfo : NSObject
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, assign) int gender;
@property (nonatomic, assign) int age;
@property (nonatomic, strong) NSString *address;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
