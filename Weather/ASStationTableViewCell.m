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
@property (weak, nonatomic) IBOutlet UIImageView *documentImageView;

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
    self.descriptionLabel.text = station.stationDescription;
//    [self.documentImageView sd_setImageWithURL:@"http://www.freeiconspng.com/uploads/file-txt-icon--deepsea-blue-icons--softiconsm-2.png" placeholderImage:nil];

}

@end
