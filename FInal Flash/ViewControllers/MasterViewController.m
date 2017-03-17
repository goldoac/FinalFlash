//
//  MasterViewController.m
//  FInal Flash
//
//  Created by applaudito on 3/15/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@implementation MasterViewController

#pragma mark - View Controller

- (void)viewWillAppear:(BOOL)animated {
    // investigar que putas es eto.
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        
        //Aqui capturo el indice de la tabla seleccionada
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //aqui obtengo la celda seleccionada de la tabla y se la asigno a una variable tipo celda
        //porque me es mas facil usarla asi despues en vez de tener una gran linea de codigo para obtener
        //lo que necesito
        UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:selectedCell.textLabel.text];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Actions

- (IBAction)reloadDataAction:(id)sender {
    [self.tableView reloadData];
}

@end
