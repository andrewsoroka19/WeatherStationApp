//
//  ASStation.h
//  Weather
//
//  Created by Andrew Soroka on 11/7/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASStation : NSObject

@property (strong, nonatomic) NSString *stationTitle;
@property (strong, nonatomic) NSString *stationPath;

- (ASStation *)initWithDictionary:(NSDictionary *)dictionary;

@end
