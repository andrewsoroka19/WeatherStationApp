//
//  ASStationTableViewCell.m
//  Weather
//
//  Created by Andrew Soroka on 11/7/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASStationTableViewCell.h"
#import "ASStation.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface ASStationTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation ASStationTableViewCell

+ (NSString *)reuseIdentifier {
    return @"ASStationTableViewCell";
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.descriptionLabel.text = nil;
}

- (void)setStation:(ASStation *)station {
    _station = station;
    self.descriptionLabel.text = station.stationTitle;
}

@end
