//
//  Carro.h
//  Carros
//
//  Created by Ricardo Lecheta on 8/18/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carro : NSObject

@property int _id;

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *desc;
@property (nonatomic, retain) NSString *url_foto;
@property (nonatomic, retain) NSString *url_info;
@property (nonatomic, retain) NSString *url_video;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *longitude;

@property (nonatomic, retain) NSString *tipo;

@end
