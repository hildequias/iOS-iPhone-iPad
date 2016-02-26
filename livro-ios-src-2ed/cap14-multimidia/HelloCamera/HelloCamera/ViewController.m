//
//  ViewController.m
//  HelloCamera
//
//  Created by Ricardo Lecheta on 8/31/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize popover;

- (void)viewDidLoad {
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    BOOL cameraDisponivel = [UIImagePickerController
                             isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    if (! cameraDisponivel) {
        // Esconde o botão da câmera
        btnCamera.hidden = YES;
    }
}

#pragma mark eventos
- (void)tirarFoto:(id)sender {
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    BOOL iPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
    if (iPad) {
        // Exibe o popover
        UIButton *bt = (UIButton *) sender;
        self.popover = [[UIPopoverController alloc]
                                        initWithContentViewController:imagePicker];
        [self.popover presentPopoverFromRect:[bt bounds] inView:bt
               permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}
- (void)escolherFoto:(id)sender {
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    BOOL iPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
    if (iPad) {
        // Exibe o popover
        UIButton *bt = (UIButton *) sender;
        self.popover = [[UIPopoverController alloc]
                                        initWithContentViewController:imagePicker];
        [self.popover presentPopoverFromRect:[bt bounds] inView:bt
               permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    } else {
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

#pragma mark
- (void)imagePickerControllerDidCancel:(UIImagePickerController *) Picker {
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *) Picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // Cria a imagem com o resultado (foto da câmera ou da galeria)
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    imageView.image = image;
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
    
    if(self.popover) {
        [self.popover dismissPopoverAnimated:YES];
        self.popover = nil;
    }
}

@end
