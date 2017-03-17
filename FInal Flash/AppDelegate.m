//
//  AppDelegate.m
//  FInal Flash
//
//  Created by applaudito on 3/15/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "AppDelegate.h"
#import "AFFNavigation.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[AFFNavigation sharedInstance] setUpNavigationWithWindow:self.window];
    return YES;
}

@end
