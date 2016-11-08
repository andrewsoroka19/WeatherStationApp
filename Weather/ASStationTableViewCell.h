//
//  ASStationTableViewCell.h
//  Weather
//
//  Created by Andrew Soroka on 11/7/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASStation.h"

@interface ASStationTableViewCell : UITableViewCell

@property (strong, nonatomic) ASStation *station;

+ (NSString *)reuseIdentifier;


@end
