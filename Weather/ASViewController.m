//
//  ViewController.m
//  Weather
//
//  Created by Andrew Soroka on 11/7/16.
//  Copyright © 2016 Andrew Soroka. All rights reserved.
//

#import "ASViewController.h"
#import "ASDownloadManager.h"
#import "ASStation.h"
#import "ASStationTableViewCell.h"

@interface ASViewController ()

@property (strong, nonatomic) UIActivityIndicatorView *activity;
@property (strong, nonatomic) NSArray<ASStation *> *stations;


@end

@implementation ASViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareTableView];
    [self loadStations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareTableView {
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 76.0;
}

//- (void) loadWeatherInfo {
//  load information about station's weather
//}


#pragma mark - Networking

- (void)loadStations {
    [self.activity startAnimating];
    __weak typeof(self) weakSelf = self;
    [ASDownloadManager fetchAllStations:^(NSArray<ASStation *> *stations) {
        weakSelf.stations = stations;
        [weakSelf.activity stopAnimating];
        weakSelf.activity.hidden = YES;
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ASStationTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[ASStationTableViewCell reuseIdentifier]];
    cell.station = self.stations[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ASStation *selectedStation = self.stations[indexPath.row];
//    [self loadWeatherInfo:selectedStation];
}

- (UIActivityIndicatorView *)activity {
    if (!_activity) {
        _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
        CGSize tableSize = self.tableView.bounds.size;
        _activity.center = CGPointMake(tableSize.width / 2, 25);
        [self.tableView addSubview:_activity];
    }
    return _activity;
}


@end
