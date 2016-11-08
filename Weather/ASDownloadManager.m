//
//  ASDownloadManager.m
//  Weather
//
//  Created by Andrew Soroka on 11/7/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASDownloadManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation ASDownloadManager

NSString * const allStationURL = @"https://data.gov.uk/dataset/historic-monthly-meteorological-station-data/datapackage.json";
NSString * const weatherBaseURL = @"http://www.metoffice.gov.uk/pub/data/weather/uk/climate/station";

+ (void)fetchAllStations:(StationFetchCompletion)handler {
    if (!handler) {
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:allStationURL parameters: nil progress: nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:NSDictionary.class] == NO) {
            handler(nil);
            return;
        }
        NSArray *results = responseObject[@"resources"];
        NSMutableArray *sources = [NSMutableArray array];
        for (NSDictionary *dictionary in results) {
            ASStation *station = [[ASStation alloc] initWithDictionary:dictionary];
            if (station) {
                [sources addObject:station];
            }
        }
        handler(sources);
    }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"Error : %@", error.localizedDescription);
             handler(nil);
         }];
}

+ (void)fetchWeatherHistoryInfo:(NSString *)stationNamen withHandler:(WeatherHistoryFetchCompletion)handler {
    if (!handler) {
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSString *urlString = [weatherBaseURL stringByAppendingString:stationNamen];
    
    [manager GET:urlString parameters: nil progress: nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:NSDictionary.class] == NO) {
            handler(nil);
            return;
        }
        NSArray *results = responseObject[@"articles"];
        NSMutableArray *weatherInfo = [NSMutableArray array];
        for (NSDictionary *dictionary in results) {
            ASWeatherHistory *weather = [[ASWeatherHistory alloc] init];
            if (weatherInfo) {
                [weatherInfo addObject:weather];
            }
        }
        handler(weatherInfo);
    }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"Error : %@", error.description);
             handler(nil);
         }];
}





@end
