//
//  ASStation.m
//  Weather
//
//  Created by Andrew Soroka on 11/7/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASStation.h"

@implementation ASStation

- (ASStation *)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.stationDescription = dictionary[@"description"];
        self.stationPath = dictionary[@"path"];
    }
    return self;
}


@end
