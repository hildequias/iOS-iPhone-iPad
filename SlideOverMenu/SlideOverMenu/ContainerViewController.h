//
//  ContainerViewController.h
//  SlideOverMenu
//
//  Created by Carlos Irano on 26/04/15.
//  Copyright (c) 2015 Carlos Irano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CenterViewDelegate.h"

// controla os estados do menu
typedef enum slideOutStateTypes {
    BothCollapsed, // menu expandido
    RightPanelExpanded // menu fechado
} SlideOutState;

@interface ContainerViewController : UIViewController <CenterViewDelegate, UIGestureRecognizerDelegate>

@end
