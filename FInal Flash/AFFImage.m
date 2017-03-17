//
//  AFFImage.m
//  FInal Flash
//
//  Created by Juan Garcia on 3/17/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "AFFImage.h"

@interface AFFImage ()
@property (strong, nonatomic) NSMutableDictionary *cache;
@end

@implementation AFFImage

- (NSMutableDictionary *)cache {
    if (!_cache) {
        _cache = [NSMutableDictionary new];
    }
    return _cache;
}

- (void)imageFromURL:(NSURL *)url completion:(void (^)(UIImage *image))completion {
    
    UIImage *image = self.cache[url.absoluteString];
    if (image) {
        if (completion) {
            completion(self.cache[url.absoluteString]);
        }
        return;
    }
    __weak typeof (self) weakSelf = self;
    [self downloadImageAtURL:url completion:^(UIImage *image) {
        if (image) {
            [weakSelf.cache setObject:image forKey:url.absoluteString];
        }
        if (completion) {
            completion(image);
        }
    }];
}

- (void)downloadImageAtURL:(NSURL *)url completion:(void (^)(UIImage *image))completion {

    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(image);
                });
            }
        }
    }];
    [task resume];
}



@end
