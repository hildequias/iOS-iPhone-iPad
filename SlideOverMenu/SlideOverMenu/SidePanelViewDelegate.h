//
//  SidePanelViewDelegate.h
//  SlideOverMenu
//
//  Created by Carlos Irano on 30/04/15.
//  Copyright (c) 2015 Carlos Irano. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SidePanelViewDelegate <NSObject>

@required
- (void)abreOufechaMenu;

@optional
- (void)animalSelected;
- (void)fechaOmenuComDedo;

@end
