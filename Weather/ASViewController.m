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
#import "ASStationResponse.h"
#import "ASTextViewController.h"

@interface ASViewController ()

@property (strong, nonatomic) UIActivityIndicatorView *activity;
@property (strong, nonatomic) NSArray<ASStation *> *stations;

@end

@implementation ASViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadStations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Networking

- (void)loadStations {
    [self.activity startAnimating];
    __weak typeof(self) weakSelf = self;
    [ASDownloadManager fetchAllStations:^(ASStationResponse *response) {
        weakSelf.title = response.title;
        weakSelf.stations = response.stations;
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
    
    __weak typeof(self) weakSelf = self;
    [ASDownloadManager fetchWeatherHistoryInfo:selectedStation.stationPath withHandler:^(NSString *historyString) {
        ASTextViewController *textController = [weakSelf.storyboard instantiateViewControllerWithIdentifier:[ASTextViewController identifier]];
        textController.text = historyString;
        [weakSelf.navigationController pushViewController:textController animated:YES];
    }];
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
