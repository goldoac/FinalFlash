//
//  AFFNavigation.h
//  FInal Flash
//
//  Created by Juan Garcia on 3/17/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

@import UIKit;

@interface AFFNavigation : NSObject

+ (instancetype)sharedInstance;
- (void)setUpNavigationWithWindow:(UIWindow *)window;

@end
