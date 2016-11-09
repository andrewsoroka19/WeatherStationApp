//
//  ASStationTableViewCell.m
//  Weather
//
//  Created by Andrew Soroka on 11/9/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//


#import "ASTextViewController.h"

@interface ASTextViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ASTextViewController

+ (NSString *)identifier {
    return @"ASTextViewController";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.text = self.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
