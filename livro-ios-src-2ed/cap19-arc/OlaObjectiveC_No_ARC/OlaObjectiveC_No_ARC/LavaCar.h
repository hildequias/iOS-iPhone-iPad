//
//  LavaCar.h
//  OlaObjectiveC_No_ARC
//
//  Created by Ricardo Lecheta on 9/5/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Carro.h"

@interface LavaCar : NSObject {
    
    Carro *carro;
    
}

- (void) lavarCarro;

@property (nonatomic, retain) Carro* carro;

@end
