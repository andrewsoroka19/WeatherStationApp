//
//  ASDownloadManager.h
//  Weather
//
//  Created by Andrew Soroka on 11/7/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASStation.h"
#import "ASStationResponse.h"

typedef void (^StationFetchCompletion)(ASStationResponse *);
typedef void (^WeatherHistoryFetchCompletion)(NSString *);


@interface ASDownloadManager : NSObject

+ (void)fetchAllStations:(StationFetchCompletion)handler;
+ (void)fetchWeatherHistoryInfo:(NSString *)stationNamen withHandler:(WeatherHistoryFetchCompletion)handler;

@end
