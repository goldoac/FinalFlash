//
//  AFFMainSplitViewControllerDelegate.m
//  FInal Flash
//
//  Created by Juan Garcia on 3/17/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "AFFMainSplitViewControllerDelegate.h"
#import "DetailViewController.h"


@implementation AFFMainSplitViewControllerDelegate

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    
    BOOL navigationControllerInSecondaryViewController                  = [secondaryViewController isKindOfClass:[UINavigationController class]];
    BOOL detailViewControllerIsPresentedBySecondaryNavigationController = [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]];
    BOOL selectedRestauranExistInDetainViewController                   = !((DetailViewController *)[(UINavigationController *)secondaryViewController topViewController]).selectedRestaurant;
    
    if (navigationControllerInSecondaryViewController && detailViewControllerIsPresentedBySecondaryNavigationController && selectedRestauranExistInDetainViewController) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    }
    else {
        return NO;
    }
}

@end
