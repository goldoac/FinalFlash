//
//  ModelFood.h
//  FInal Flash
//
//  Created by tavo7910 on 3/15/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AFFRestaurantAPI : NSObject

- (void)getListOfRestaurant :(void (^)(NSDictionary *dictionary))completionBlock;

@end
