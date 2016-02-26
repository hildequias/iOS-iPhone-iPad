//
//  MyITabBarController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/24/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "MyTabBarController.h"

@implementation MyTabBarController

#pragma mark - rotation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    // Delega para o view controller atual
    return [self.selectedViewController
            shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
    
}

- (NSUInteger) supportedInterfaceOrientations {
    // Delega para o view controller atual
    return [self.selectedViewController supportedInterfaceOrientations];
    
}

@end
