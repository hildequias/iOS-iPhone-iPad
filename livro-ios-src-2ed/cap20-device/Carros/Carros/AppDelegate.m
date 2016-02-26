//
//  AppDelegate.m
//  Carros
//
//  Created by Ricardo Lecheta on 8/18/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "AppDelegate.h"
#import "ListaCarrosViewController.h"
#import "ListaCarrosViewController_iPad.h"
#import "SobreViewController.h"
#import "DetalhesCarroViewController.h"
#import "DetalhesCarroViewController_iPad.h"
#import "EsquerdaViewController.h"
#import "DireitaViewController.h"
#import "Utils.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    BOOL iPad = [Utils isIpad];
    if (iPad) {
        [self initIphone];
    } else {
        [self initIphone];
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)initIphone {
    // Tab 1: Cria um NavigationController com o ListaCarrosViewController
    ListaCarrosViewController *listaController = [[ListaCarrosViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] init];
    [nav1 pushViewController:listaController animated:NO];
    // Tab 2: Cria um NavigationController com o SobreViewController
    SobreViewController *sobreController = [[SobreViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] init];
    [nav2 pushViewController:sobreController animated:NO];
    // Cria a TabBarController (Tab 1 = Lista, Tab 2 = Sobre)
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = [NSArray arrayWithObjects:nav1, nav2, nil];
    // Título e imagem de cada Tab
    nav1.tabBarItem.title = @"Carros";
    nav1.tabBarItem.image = [UIImage imageNamed:@"tab_carros.png"];
    nav2.tabBarItem.title = @"Sobre";
    nav2.tabBarItem.image = [UIImage imageNamed:@"tab_sobre.png"];
    // Deixa a TabBarController como o controller principal
    self.window.rootViewController = tabBarController;
}

- (void)initIpad {
    // Cria os controllers
//    EsquerdaViewController *esquerda = [[EsquerdaViewController alloc] init];
//    DireitaViewController *direita = [[DireitaViewController alloc] init];
    
    // Esquerda
    //ListaCarrosViewController *listaController = [[ListaCarrosViewController alloc] init];
    ListaCarrosViewController_iPad *listaController = [[ListaCarrosViewController_iPad alloc]
                                                        initWithNibName:@"ListaCarrosViewController" bundle:nil];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:listaController];

    // Direita
    DetalhesCarroViewController_iPad *detalhesController = [[DetalhesCarroViewController_iPad alloc] init];
    listaController.detalhesController = detalhesController;
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:detalhesController];

    // Cria o UISplitViewController (Esquerda = Lista, Direita = Detalhes)
    UISplitViewController *split = [[UISplitViewController alloc] init];
    split.delegate = detalhesController;
    split.viewControllers = [NSArray arrayWithObjects:nav1,nav2
                             , nil];
    //split.viewControllers = [NSArray arrayWithObjects:nav1 ,nav2, nil];
    
    // Deixa o UISplitViewController como o controller principal
    self.window.rootViewController = split;
}

@end
