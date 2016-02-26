//
//  ViewController.m
//  HelloPush
//
//  Created by Ricardo Lecheta on 9/7/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    NSLog(@"viewDidLoad");
}

- (IBAction)addLocalNotification {
    NSLog(@"addLocalNotification");
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.alertBody = @"Teste de Mensagem";
    localNotification.alertAction = @"Ação aqui";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber]+1;
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    //    localNotification.repeatInterval = NSSecondCalendarUnit;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

    NSLog(@"OK");
    
}

@end
