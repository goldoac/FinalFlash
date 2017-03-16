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
@property (strong, nonatomic) NSString *cellText;
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
        
      
        //Aqui capturo el indice de la tabla seleccionada
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //aqui obtengo la celda seleccionada de la tabla y se la asigno a una variable tipo celda
        //porque me es mas facil usarla asi despues en vez de tener una gran linea de codigo para obtener
        //lo que necesito
        UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
        //a celltext que es de tipo NSString le doy el texto de la celda seleccionada.
        self.cellText = selectedCell.textLabel.text;
        
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:self.cellText];
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
   
    /*
    [self.modeloComida cargarFoto:indexPath completion:^(UIImage *imagenCargar) {
        cell.imageView.image=  imagenCargar;
        [cell setNeedsLayout];
    }]; */
    
    
 
    //Creo un objeto de tipo URL  pidiendo el string que tiene http://..  al dictAux por medio de la key Logo URL
    NSURL *url = [NSURL URLWithString:[dicAux objectForKey:@"Logo URL"]];
    //comienzo a pedir ls imagenes en un hilo aparte, utilizando ese objeto URL.
    //Las variables enviadas por parametro son las que ya me pone por defecto Xcode.  data, response, error
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    //si  el metodo dataTaskWithURL  genera data,  osea,  tuvo exito con la URL, entonces sacamos la imagen.
        if (data) {
            //UIImage ya trae un metodo para <<intentar>> obtener imagen de datos generados.
            UIImage *image = [UIImage imageWithData:data];
            //si de verdad esos datos eran una imagen.  sino es nil.
            if (image) {
                //ya teniendo la imagen, la inserto en la celda llamando al hilo principal.  sino no mostrara nada.
                dispatch_async(dispatch_get_main_queue(), ^{
                    //las celdas de tabla no tienen image, sino imageViews.
                    cell.imageView.image = image;
                    [cell setNeedsLayout];
                });
            }
        }
    }];
    [task resume];
    
    cell.textLabel.text = [dicAux objectForKey:@"Name"];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



@end
