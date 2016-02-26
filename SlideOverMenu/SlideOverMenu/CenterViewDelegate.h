//
//  CenterViewDelegate.h
//  SlideOverMenu
//
//  Created by Carlos Irano on 27/04/15.
//  Copyright (c) 2015 Carlos Irano. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CenterViewDelegate <NSObject>

@optional
- (void)toggleRightPanel;
- (void)collapseSidePanels;
- (void)collapseSidePanels2;
- (void)carregaItemDoMenu;
@end
