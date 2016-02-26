//
//  AppDelegate.m
//  SlideOverMenu
//
//  Created by Carlos Irano on 24/04/15.
//  Copyright (c) 2015 Carlos Irano. All rights reserved.
//

#import "AppDelegate.h"
#import "ContainerViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self adjustNavigationBarAppearance];
    
    // atribui pra janela
    
    [self.window setRootViewController:[[ContainerViewController alloc] init]];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)adjustNavigationBarAppearance {
    
    // configuracao do navigation bar
    UINavigationBar *proxy = [UINavigationBar appearance];
    
    //proxy.clipsToBounds = YES;
    //[proxy setBackgroundImage:[UIImage new] forBarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];
    //proxy.backgroundColor = [UIColor yellowColor];
    
    //[proxy setTranslucent:NO];
    //proxy.shadowImage = nil;
    
    [proxy setTintColor: [UIColor whiteColor]];
    [proxy setBarTintColor: [UIColor colorWithRed:41/255.0f green:119/255.0f blue:227/255.0f alpha:1.0f]];
    
    NSDictionary *titleTextAttributes = @{
                                 NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:22],
                                 NSForegroundColorAttributeName: [UIColor whiteColor],
                                 };
    proxy.titleTextAttributes = titleTextAttributes;
    proxy.barStyle = UIBarStyleBlackTranslucent;
}

@end
