//
//  DetalhesCarroViewController_iPad.m
//  Carros
//
//  Created by Ricardo Lecheta on 8/31/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "DetalhesCarroViewController_iPad.h"
#import "ListaCarrosViewController.h"
#import "VideoUtil.h"

@implementation DetalhesCarroViewController_iPad

@synthesize videoView;
@synthesize popover;
@synthesize popoverController;

#pragma mark orientation - iOS 5
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

#pragma mark Métodos
- (void)visualizarVideo {
    VideoUtil *v = [[VideoUtil alloc] init] ;
    NSURL *url = [NSURL URLWithString:self.carro.url_video];
    [v playUrl:url withView:self.videoView];
}

#pragma mark Popover
- (IBAction)abrirPopover:(id)sender {
    ListaCarrosViewController *listaController = [[ListaCarrosViewController alloc] init];
    UIButton *botao = (UIButton *) sender;
    self.popover = [[UIPopoverController alloc]
                                    initWithContentViewController:listaController];
    [self.popover presentPopoverFromRect:[botao bounds] inView:botao
           permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if(self.popover) {
        [self.popover dismissPopoverAnimated:YES];
        self.popover = nil;
    }
}

- (void)exibeCarro {
    [super exibeCarro];
    // Sempre depois de exibir o carro, se o popover está aberto vamos fechá-lo
    if (popoverController) {
        [popoverController dismissPopoverAnimated:YES];
    }
}

#pragma mark - UISplitViewControllerDelegate
- (void)splitViewController: (UISplitViewController*)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem*)barButtonItem
       forPopoverController: (UIPopoverController*)pc {
    barButtonItem.title = @"Carros";
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.popoverController = pc;
}
- (void)splitViewController: (UISplitViewController*)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
}

@end
