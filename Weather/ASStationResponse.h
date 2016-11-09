//
//  ASStationTableViewCell.m
//  Weather
//
//  Created by Andrew Soroka on 11/9/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ASStation.h"

@interface ASStationResponse : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *stations;

- (ASStationResponse *)initWithDictionary:(NSDictionary *)dictionary;

@end
