//
//  ModelFood.m
//  FInal Flash
//
//  Created by tavo7910 on 3/15/17.
//  Copyright © 2017 applaudito. All rights reserved.
//


// @"https://api.myjson.com/bins/z2otb"

#import "AFFRestaurantAPI.h"

NSString * const APIURL = @"https://api.myjson.com/bins/z2otb";

@interface AFFRestaurantAPI ()

@end

@implementation AFFRestaurantAPI


- (void)getListOfRestaurant :(void (^)(NSDictionary *dictionary))completionBlock {
    
    NSURL *url = [NSURL URLWithString:APIURL];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        id result = nil;
        if (!error) {
            NSError *JSONError = nil;
            result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONError];
            if (![result isKindOfClass:[NSDictionary class]] || JSONError) {
                result = nil;
            }
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completionBlock) {
                completionBlock(result);
            }
        });
    }];

    [task resume];
}


@end
