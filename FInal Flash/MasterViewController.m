//
//  MasterViewController.m
//  FInal Flash
//
//  Created by applaudito on 3/15/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ModelFood.h"

@interface MasterViewController ()
@property (strong, nonatomic) ModelFood *modeloComida;
@property NSMutableArray *objects;
@end

@implementation MasterViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    [self.modeloComida conexion];
}

- (ModelFood *)modeloComida {
    if (!_modeloComida) {
        _modeloComida = [[ModelFood alloc] initWithURL:@"https://api.myjson.com/bins/z2otb"];
    }
    return _modeloComida;
    
}
- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSArray *contador = [self.modeloComida.dictionary allKeys];
    NSLog(@" VER SIIIIII %lu",(unsigned long)[self.modeloComida.dictionary count]);
    return [contador count];
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray *titulos = [self.modeloComida.dictionary allKeys];
    __block NSString *tituloString;
    [titulos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        if(idx == section) {
            tituloString = obj;
            NSLog(@"%lu %@",(unsigned long)idx,tituloString);
        }
            }];

    return tituloString;

}

/*- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}*/


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


#pragma mark - Table View




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *keyNameArray = [self.modeloComida.dictionary allKeys];
    NSArray *keyNameFoodArray = [self.modeloComida.dictionary objectForKey:[keyNameArray objectAtIndex:section]];
    NSLog(@"HEY FILASSSS %lu",(unsigned long)[keyNameFoodArray count]);
    return [keyNameFoodArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSArray *keysArray = [self.modeloComida.dictionary allKeys];
    NSArray *keyNameFoodArray = [self.modeloComida.dictionary objectForKey:[keysArray objectAtIndex:indexPath.section]];
    NSDictionary *dicAux = [keyNameFoodArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dicAux objectForKey:@"Name"];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
