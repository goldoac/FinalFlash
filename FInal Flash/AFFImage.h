//
//  AFFImage.h
//  FInal Flash
//
//  Created by Juan Garcia on 3/17/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

@import UIKit;

@interface AFFImage : NSObject
- (void)imageFromURL:(NSURL *)url completion:(void (^)(UIImage *image))completion;

@end
