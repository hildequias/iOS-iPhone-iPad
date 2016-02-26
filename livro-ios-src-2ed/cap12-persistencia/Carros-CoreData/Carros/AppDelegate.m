//
//  AppDelegate.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "AppDelegate.h"

#import "ListaCarrosViewController.h"
#import "DetalhesCarroViewController.h"
#import "SobreViewController.h"
#import "MyTabBarController.h"
#import "MyNavigationController.h"

@implementation AppDelegate

// Sintaxe _propriedade permite acessar como var local, sintaxe self.propriedade vai
// acessar o getter/setter
@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    // Tab 1: Cria um NavigationController com o ListaCarrosViewController
    
    ListaCarrosViewController *listaController = [[ListaCarrosViewController alloc] init];
    
    UINavigationController *nav1 = [[MyNavigationController alloc] init];
    
    [nav1 pushViewController:listaController animated:NO];
    
    // Tab 2: Cria um NavigationController com o SobreViewController
    
    SobreViewController *sobreController = [[SobreViewController alloc] init];
    
    UINavigationController *nav2 = [[UINavigationController alloc] init];
    
    [nav2 pushViewController:sobreController animated:NO];
    
    // Cria a TabBarController (Tab 1 = Lista, Tab 2 = Sobre)
    
    UITabBarController *tabBarController = [[MyTabBarController alloc] init];
    
    tabBarController.viewControllers = [NSArray arrayWithObjects:nav1, nav2, nil];
    
    // Título e imagem de cada Tab
    
    nav1.tabBarItem.title = @"Carros";
    
    nav1.tabBarItem.image = [UIImage imageNamed:@"tab_carros.png"];
    
    nav2.tabBarItem.title = @"Sobre";
    
    nav2.tabBarItem.image = [UIImage imageNamed:@"tab_sobre.png"];
    
    // Deixa a TabBarController como o controller principal
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - Core Data stack
// Retorna o managed object context da aplicação
- (NSManagedObjectContext *)managedObjectContext {
	if (__managedObjectContext != nil) {
		return __managedObjectContext;
	}
	NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
	if (coordinator != nil) {
		__managedObjectContext = [[NSManagedObjectContext alloc] init];
		[__managedObjectContext setPersistentStoreCoordinator:coordinator];
	}
	return __managedObjectContext;
}
// Retorna o managed object model da aplicação.
// É o arquivo CarrosModel.xcdatamodeld
- (NSManagedObjectModel *)managedObjectModel {
	if (__managedObjectModel != nil) {
		return __managedObjectModel;
	}
	NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CarrosModel"
                                              withExtension:@"momd"];
	__managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
	return __managedObjectModel;
}
// Retorna o persistent store coordinator da aplicação.
// Aqui é definido o nome do arquivo que vai conter o banco de dados
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
	if (__persistentStoreCoordinator != nil) {
		return __persistentStoreCoordinator;
	}
	NSURL *storeURL = [[self applicationDocumentsDirectory]
                       URLByAppendingPathComponent:@"CarrosCoreData.sqlite"];
	NSError *error = nil;
	__persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                    initWithManagedObjectModel:[self managedObjectModel]];
	if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                    configuration:nil URL:storeURL options:nil error:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
	return __persistentStoreCoordinator;
}
#pragma mark - Application's Documents directory
// Retorna a URL para o caminho do arquivo utilizado para o banco de dados.
- (NSURL *)applicationDocumentsDirectory {
	NSURL *path = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                          inDomains:NSUserDomainMask] lastObject];
	NSLog(@"DB PATH %@", path);
	return path;
}

@end
