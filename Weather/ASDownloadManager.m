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
        
        ASStationResponse *response = [[ASStationResponse alloc] initWithDictionary:responseObject];
        handler(response);
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
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:[weatherBaseURL stringByAppendingString:stationNamen]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSData *data = [NSData dataWithContentsOfURL:filePath];
        NSString* string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        handler(string);
    }];
    
    [downloadTask resume];
}

@end
