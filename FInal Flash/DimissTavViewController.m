//
//  DimissTavViewController.m
//  FInal Flash
//
//  Created by applaudito on 3/16/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "DimissTavViewController.h"

@interface DimissTavViewController ()<UITabBarControllerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *tabLabel;
@property (strong, nonatomic) IBOutlet UITabBarItem *dimissTab;

@end

@implementation DimissTavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabLabel.text = self.tabString;
    self.tabBarController.delegate = self;
   
    
    
}

-(void) viewWillAppear:(BOOL)animated {
    
  
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    id objectController = window.rootViewController;
    if([objectController isKindOfClass:[UISplitViewController class]]) {
         id object2 = [[objectController viewControllers] lastObject];
        
        if([object2 isKindOfClass:[UINavigationController class]]) {
            NSLog(@"si es navigation class");
            [object2 setNavigationBarHidden:YES animated:YES];
        }
    }
   
   
   
  
    
    
}


- (IBAction)dimiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSUInteger indexOfTab = [tabBarController.viewControllers indexOfObject:viewController];
    NSLog(@"Tab index = %lu ", (unsigned long)indexOfTab);


}

@end
