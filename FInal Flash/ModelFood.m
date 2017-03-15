//
//  ModelFood.m
//  FInal Flash
//
//  Created by tavo7910 on 3/15/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "ModelFood.h"

@interface ModelFood ()
@property (strong, nonatomic) NSString *stringURL;
@property (strong, nonatomic) NSDictionary *dictionary;
@end

@implementation ModelFood

-(instancetype) initWithURL: (NSString*) aStringURL{
    if (self=[super init]) {
        self.stringURL = aStringURL;
    }
    return self;
}

-(NSDictionary *) dictionary{
    if(!_dictionary){
        _dictionary = @{};
    }
    return _dictionary;
}


-(void)conexion{
    
    NSURL *url = [NSURL URLWithString:self.stringURL];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                             completionHandler:^(NSData *data,
                                                                                 NSURLResponse *response,
                                                                                 NSError *error)
                                  {
                                      if (!error)
                                      {
                                          NSError *JSONError = nil;
                                          
                                        id objeto= [NSJSONSerialization JSONObjectWithData:data
                                                                                            options:0
                                                                                              error:&JSONError];
                                          if ([objeto isKindOfClass:[NSDictionary class]]) {
                                              self.dictionary = objeto;
                                              NSLog(@"aqui esta %@", self.dictionary);
                                          }
                                          if (JSONError)
                                          {
                                              NSLog(@"Serialization error: %@", JSONError.localizedDescription);
                                          }
                                          else
                                          {
                                              NSLog(@"Response: %@", self.dictionary);
                                          }
                                      }
                                      else
                                      {
                                          NSLog(@"Error: %@", error.localizedDescription);
                                      }
                                  }];
    // Start the task.
    [task resume];
}
@end