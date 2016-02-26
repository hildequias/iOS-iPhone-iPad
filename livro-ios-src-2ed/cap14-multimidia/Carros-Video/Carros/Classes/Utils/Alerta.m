//
//  Alerta.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "Alerta.h"

@implementation Alerta

+(void) alerta: (NSString *) msg {
    
    UIAlertView *alert =
    
    [[UIAlertView alloc] initWithTitle:@"Alerta" message:msg delegate:self
     
                     cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
        
}

@end
