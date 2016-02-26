//
//  AppDelegate.m
//  HelloPush
//
//  Created by Ricardo Lecheta on 9/7/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UILocalNotification *notification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    
    if (notification) {
        // Chega aqui se a app estava fechada
        NSLog(@"Recebeu Local Notification: %@", notification);
        
        UIAlertView *aw = [[UIAlertView alloc] initWithTitle:@"Caso 2" message: notification.alertBody delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [aw show];
    }
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"applicationDidBecomeActive");
    
    
}

#pragma mark Local Notification
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"didReceiveLocalNotification %@", notification);
    NSLog(@"Alert Action %@", notification.alertAction);
    NSLog(@"Alert Body %@", notification.alertBody);
    
    // Chama esse método se a app está aberta ou em background
    UIAlertView *aw = [[UIAlertView alloc] initWithTitle:@"Caso 1" message: notification.alertBody delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [aw show];

    application.applicationIconBadgeNumber = 0;
}


@end
