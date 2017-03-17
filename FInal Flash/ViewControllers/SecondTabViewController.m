//
//  SecondTabViewController.m
//  FInal Flash
//
//  Created by applaudito on 3/16/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "SecondTabViewController.h"

@interface SecondTabViewController ()<UITabBarControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *tabLabel;

@end

@implementation SecondTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabLabel.text = self.tabString;
     self.tabBarController.delegate = self;
   
}


-(void) viewWillAppear:(BOOL)animated {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    id objectController = window.rootViewController;
    if([objectController isKindOfClass:[UISplitViewController  class]]) {
        id object2 = [[objectController viewControllers] lastObject];
        
        if([object2 isKindOfClass:[UINavigationController class]]) {
            [object2 setNavigationBarHidden:NO animated:YES];
        }
    }
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSUInteger indexOfTab = [tabBarController.viewControllers indexOfObject:viewController];
    NSLog(@"Tab index = %lu ", (unsigned long)indexOfTab);
       [self.tabBarController.navigationController setNavigationBarHidden:NO animated:YES];
    
}

@end
