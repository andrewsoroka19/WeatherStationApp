#import <Foundation/Foundation.h>
#import "ASStation.h"

@interface ASStationResponse : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *stations;

- (ASStationResponse *)initWithDictionary:(NSDictionary *)dictionary;

@end
