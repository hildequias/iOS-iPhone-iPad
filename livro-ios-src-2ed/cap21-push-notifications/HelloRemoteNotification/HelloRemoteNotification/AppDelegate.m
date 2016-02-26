//
//  AppDelegate.m
//  HelloRemoteNotification
//
//  Created by Ricardo Lecheta on 9/7/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Faz o registro no push
    [application registerForRemoteNotificationTypes:
        (UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    
    application.applicationIconBadgeNumber = 0;

    return YES;
}

#pragma mark push
- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
	
    // Recebei o device token
    NSLog(@"Device Registrado %@", deviceToken);
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
	
    NSString *str = [NSString stringWithFormat: @"Error: %@", err];
    NSLog(@"Erro ao registrar [%@]",str);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo  {
    NSLog(@"Recebeu notificacao %@", userInfo);
    
    // Lê a mensagem
    NSString *msg = userInfo[@"aps"][@"alert"];
    
    // Chama esse método se a app está aberta ou em background
    UIAlertView *aw = [[UIAlertView alloc] initWithTitle:@"Remote Notification" message: msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [aw show];
    
    application.applicationIconBadgeNumber = 0;
    
}

@end
