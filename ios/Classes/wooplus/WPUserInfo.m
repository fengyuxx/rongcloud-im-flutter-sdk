//
//  WPUserInfo.m
//  Runner
//
//  Created by Elvin Gao on 2019/8/27.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "WPUserInfo.h"

@implementation WPUserInfo
- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    if(dictionary == nil || [dictionary isKindOfClass:[NSNull class]]) return nil;
    self = [super init];
    self.userId = dictionary[@"userId"];
    self.displayName = dictionary[@"displayName"];
    self.gender = [dictionary[@"gender"] intValue];
    self.age = [dictionary[@"age"] intValue];
    self.address = dictionary[@"address"];
    return self;
}

- (NSDictionary *)dictionary{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    if(self.userId) [dictionary setObject:self.userId forKey:@"userId"];
    if(self.displayName) [dictionary setObject:self.displayName forKey:@"displayName"];
    if(self.gender) [dictionary setObject:@(self.gender) forKey:@"gender"];
    if(self.age) [dictionary setObject:@(self.age) forKey:@"age"];
    if(self.address) [dictionary setObject:self.address forKey:@"address"];
    return dictionary;
}


@end
