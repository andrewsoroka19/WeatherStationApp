#import "ASStationResponse.h"

@implementation ASStationResponse

- (ASStationResponse *)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[@"title"];
        
        NSArray *results = dictionary[@"resources"];
        NSMutableArray *sources = [NSMutableArray array];
        for (NSDictionary *dictionary in results) {
            if (![dictionary[@"format"] isEqualToString:@"TXT"]) {
                continue;
            }
            
            ASStation *station = [[ASStation alloc] initWithDictionary:dictionary];
            if (station) {
                [sources addObject:station];
            }
        }

        self.stations = sources;
    }
    return self;

}

@end
