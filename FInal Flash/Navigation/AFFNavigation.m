//
//  AFFNavigation.m
//  FInal Flash
//
//  Created by Juan Garcia on 3/17/17.
//  Copyright © 2017 applaudito. All rights reserved.
//

#import "AFFNavigation.h"
#import "AFFMainSplitViewControllerDelegate.h"

@interface AFFNavigation ()
@property (strong, nonatomic) AFFMainSplitViewControllerDelegate *mainSplitViewControllerDelegate;
@end

@implementation AFFNavigation

#pragma mark - Singleton

// metodo que retorna una instancia de esta clase, esta instancia se creara solo una ves y sera retornada multiples veces.
+ (instancetype)sharedInstance {
    
    // crea una variable propia de GCD que se asegura de que exista solo una ves.
    // dispatch_once_t es un tipo de dato que puede algo asi como ser modificada solo una ves sin importar los hilos de donde se accesa
    static dispatch_once_t once;
    
    // variable estatica que apunta a una instacia generica (id)
    // static significa que es una propiedad que esta alocada en la clase y no en las instancias geradas,
    // en otras palabras esta variable existe en un solo lugar de la memoria sin importar el numero de instancias que hay de esta clase.
    static id sharedInstance;
    
    // macro que le dice a GCD que ejecute si esta permitido por la propiedad onde el bloque que se pasa por parametro
    // es decir &once es en realidad la direccion de memoria adonde esta alocada la variable once.
    // el siguiente parametro despues de la coma es un bloque definido asi:^ {...} es decir es un bloque que no regresa nada y que no recibe nada.
    dispatch_once(&once, ^ {
        
        // este bloque solo se encarga de crear una instancia nueva de la clase self donde self es en realidad la Class donde estaa definido este metodo:
        // + (instancetype)sharedInstance, es decir la palabr reservada self sustituye el nombre de la clase que en este caso es AFFNavigation
        // y no representa una instancia de esta clase.
        sharedInstance = [self new];
        
    });
    
    // retorna el valor almacenado en la variable estatica, en este punto si es la primera vez que se ejecuta este metodo entonces se acaba de crear la intacia
    // dentro de la variable "sharedInstance" debido al bloque dentro de dispatch_one, si no es la primera vez que se ejecuta este todo
    // la variable havia sido instanceada antes y el bloque no se ejecuto para reemplazar la intancia en esta variable estatica.
    return sharedInstance;
}

#pragma mark - Getters

- (AFFMainSplitViewControllerDelegate *)mainSplitViewControllerDelegate {
    if (!_mainSplitViewControllerDelegate) {
        _mainSplitViewControllerDelegate = [AFFMainSplitViewControllerDelegate new];
    }
    return _mainSplitViewControllerDelegate;
}

#pragma mark - setUp

- (void)setUpNavigationWithWindow:(UIWindow *)window {
    UISplitViewController *splitViewController = (UISplitViewController *)window.rootViewController;
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    splitViewController.delegate = self.mainSplitViewControllerDelegate;
}




@end
