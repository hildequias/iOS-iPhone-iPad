//
//  MyNavigationController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/24/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "MyNavigationController.h"

@implementation MyNavigationController

#pragma mark - rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return [self.topViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

- (NSUInteger) supportedInterfaceOrientations {
    // Delega para o view controller atual (é o último do array)
    return [self.topViewController supportedInterfaceOrientations];
    
}

@end
