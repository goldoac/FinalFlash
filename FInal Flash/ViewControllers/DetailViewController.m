//
//  DetailViewController.m
//  FInal Flash
//
//  Created by applaudito on 3/15/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "DetailViewController.h"
#import "SecondTabViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.selectedRestaurant) {
        self.detailDescriptionLabel.text = self.selectedRestaurant;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(NSString *)newDetailItem {
    if (![_selectedRestaurant isEqualToString:newDetailItem]) {
        _selectedRestaurant = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showTabs"]) {
        id object= [segue destinationViewController];
        NSString *className = NSStringFromClass([object class]);
        NSLog(@"Is of type: %@", className);
        SecondTabViewController *st;
        st =  [[object viewControllers] objectAtIndex:0];
        st.tabString = @"I got the label";
        SecondTabViewController *st2;
        id object2 = [[object viewControllers] objectAtIndex:1];
        className = NSStringFromClass([object2 class]);
        st2 = [[object2 viewControllers] lastObject];
        NSLog(@"second tab Is of type: %@", className);
        st2.tabString = @"I got the second label";
        //ESCONDO EL TOP NAVIGATION BAR
      //  [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}


@end
