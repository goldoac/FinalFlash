//
//  DetailViewController.m
//  FInal Flash
//
//  Created by applaudito on 3/15/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "DetailViewController.h"
#import "SecondTabViewController.h"

NSString * const DetailViewControllerShowTabsIdentifier = @"showTabs";

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

@implementation DetailViewController

- (void)configureView {
    if (self.selectedRestaurant) {
        self.detailDescriptionLabel.text = self.selectedRestaurant;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(NSString *)newDetailItem {
    if (![_selectedRestaurant isEqualToString:newDetailItem]) {
        _selectedRestaurant = newDetailItem;
        [self configureView];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:DetailViewControllerShowTabsIdentifier]) {
        
        UITabBarController *tabBarController = [segue destinationViewController];
        SecondTabViewController *st =  [[tabBarController viewControllers] objectAtIndex:0];
        st.tabString = @"I got the label";
        SecondTabViewController *st2;
        
        id object2 = [[tabBarController viewControllers] objectAtIndex:1];
        st2 = [[object2 viewControllers] lastObject];
        st2.tabString = @"I got the second label";
    }
}


@end
