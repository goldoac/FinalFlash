//
//  DetailViewController.h
//  FInal Flash
//
//  Created by applaudito on 3/15/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSString *comidaSeleccionada;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
- (void)setDetailItem:(NSString *)newDetailItem;
@end

