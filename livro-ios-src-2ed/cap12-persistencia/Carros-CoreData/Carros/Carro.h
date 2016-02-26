//
//  Carro.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/27/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Carro : NSManagedObject

@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * latitude;
@property (nonatomic, retain) NSString * longitude;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) NSString * url_foto;
@property (nonatomic, retain) NSString * url_info;
@property (nonatomic, retain) NSString * url_video;

@end
