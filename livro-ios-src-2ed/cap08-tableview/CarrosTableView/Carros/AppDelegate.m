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

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
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
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
