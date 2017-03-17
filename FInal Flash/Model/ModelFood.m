//
//  ModelFood.m
//  FInal Flash
//
//  Created by tavo7910 on 3/15/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "ModelFood.h"
#import <UIKit/UIKit.h>

@interface ModelFood ()
@property (strong, nonatomic) NSString *stringURL;
@property (strong, nonatomic) NSDictionary *dictionary;
@property (strong, nonatomic)  UIImage * fotito;
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


-(void)conexion :(void (^)(NSDictionary *dictionary))completionBlock {
    
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
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  self.dictionary = objeto;
                                                  //   NSLog(@"Response: %@", self.dictionary);
                                                  if (completionBlock) {
                                                      completionBlock(self.dictionary);
                                                  }
                                              });
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

-(void)cargarFoto: (NSIndexPath *) pathImage completion:(void (^)(UIImage *imagenCargar))completionBlock{
    
    NSArray *keysArray = [self.dictionary allKeys];
    NSArray *keyNameFoodArray = [self.dictionary objectForKey:[keysArray objectAtIndex:pathImage.section]];
    NSDictionary *dicAux = [keyNameFoodArray objectAtIndex:pathImage.row];
    NSURL *url = [NSURL URLWithString:[dicAux objectForKey:@"Logo URL"]];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                             completionHandler:^(NSData *data,
                                                                                 NSURLResponse *response,
                                                                                 NSError *error)
                                  {
                                      if (!error)
                                      {
                                          self.fotito= [UIImage imageWithData:data];
                                          if (self.fotito) {
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  if(completionBlock){
                                                      completionBlock(self.fotito);
                                                  }
                                              });
                                          }
                                      }
                                    else
                                          {
                                              NSLog(@"Response: %@", self.dictionary);
                                          }
                                      }
                                     ];
    // Start the task.
    [task resume];
}

@end
