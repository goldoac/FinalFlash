//
//  AFFMasterTableViewDataSource.m
//  FInal Flash
//
//  Created by Juan Garcia on 3/17/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "AFFMasterTableViewDataSource.h"
#import "AFFRestaurantAPI.h"
#import "AFFImage.h"

@interface AFFMasterTableViewDataSource ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) AFFRestaurantAPI *restaurantAPI;
@property (strong, nonatomic) AFFImage *imageHelper;
@property (strong, nonatomic) NSDictionary *data;
@property (nonatomic, readonly) NSArray *titles;
@end

NSString * const AFFMasterTableViewDataSourceCellIdentifier = @"AFFMasterTableViewDataSourceCellIdentifier";


@implementation AFFMasterTableViewDataSource

#pragma mark - Getters

- (AFFRestaurantAPI *)restaurantAPI {
    if (!_restaurantAPI) {
        _restaurantAPI = [AFFRestaurantAPI new];
    }
    return _restaurantAPI;
}

- (NSDictionary *)data {
    if (!_data) {
        _data = [NSDictionary new];
        [self fetchData];
    }
    return _data;
}

- (NSArray *)titles {
    return [self.data allKeys];
}

- (AFFImage *)imageHelper {
    if (!_imageHelper) {
        _imageHelper = [AFFImage new];
    }
    return _imageHelper;
}

#pragma mark - Fetch

- (void)fetchData {
    __weak typeof (self) weakSelf = self;
    [self.restaurantAPI getListOfRestaurant:^(NSDictionary *dictionary) {
        weakSelf.data = dictionary;
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titles.count;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.titles[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *keyNameFoodArray = self.data[self.titles[section]];
    return keyNameFoodArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AFFMasterTableViewDataSourceCellIdentifier forIndexPath:indexPath];
    NSArray *keyNameFoodArray = self.data[self.titles[indexPath.section]];
    NSDictionary *dicAux = [keyNameFoodArray objectAtIndex:indexPath.row];
    
    cell.imageView.image = nil;
    cell.textLabel.text = [dicAux objectForKey:@"Name"];

    NSURL *url = [NSURL URLWithString:[dicAux objectForKey:@"Logo URL"]];
    [self.imageHelper imageFromURL:url completion:^(UIImage *image) {
        cell.imageView.image = image;
        [cell setNeedsLayout];
    }];

    return cell;
}

@end
