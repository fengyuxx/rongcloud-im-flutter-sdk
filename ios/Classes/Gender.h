//
//  Gender.h
//  WooPlus
//
//  Created by TeamN on 5/18/15.
//  Copyright (c) 2015 TeamN. All rights reserved.
//

#ifndef WooPlus_Gender_h
#define WooPlus_Gender_h

typedef NS_OPTIONS(NSUInteger, Gender) {
    GenderMale      = 1 << 0,
    GenderFemale    = 1 << 1,
    GenderBoth      = (GenderMale | GenderFemale),
};

#endif
