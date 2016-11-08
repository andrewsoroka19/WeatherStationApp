//
//  ASDownloadManager.h
//  Weather
//
//  Created by Andrew Soroka on 11/7/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASStation.h"
#import "ASWeatherHistory.h"

typedef void (^StationFetchCompletion)(NSArray<ASStation *> *);
typedef void (^WeatherHistoryFetchCompletion)(NSArray<ASWeatherHistory *> *);


@interface ASDownloadManager : NSObject

+ (void)fetchAllStations:(StationFetchCompletion)handler;
//+ (void)fetchWeatherHistoryInfo:(ASStation *)station withHandler:(WeatherHistoryFetchCompletion)handler;

@end
