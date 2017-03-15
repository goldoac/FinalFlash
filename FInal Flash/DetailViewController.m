//
//  DetailViewController.m
//  FInal Flash
//
//  Created by applaudito on 3/15/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.comidaSeleccionada) {
        self.detailDescriptionLabel.text = self.comidaSeleccionada;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(NSString *)newDetailItem {
    if (![_comidaSeleccionada isEqualToString:newDetailItem]) {
        _comidaSeleccionada = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


@end
