//
//  SecondTabViewController.m
//  FInal Flash
//
//  Created by applaudito on 3/16/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "SecondTabViewController.h"

@interface SecondTabViewController ()
@property (strong, nonatomic) IBOutlet UILabel *tabLabel;

@end

@implementation SecondTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabLabel.text = self.tabString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
