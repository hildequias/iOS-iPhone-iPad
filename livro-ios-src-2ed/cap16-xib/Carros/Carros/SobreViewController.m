//
//  SobreViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 8/18/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "SobreViewController.h"

#define URL_SOBRE @"http://www.livroiphone.com.br/carros/sobre.htm"

@implementation SobreViewController

@synthesize webView, progress;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Para a view ficar posicionada abaixo do navigation controller
//    self.edgesForExtendedLayout = UIExtendedEdgeNone;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Inicia a animação do activity indicator
    [self.progress startAnimating];
    
//    self.webView.delegate = self;
//    [self.webView setDelegate:self];

    // Carrega a URL no WebView
    NSURL* url = [NSURL URLWithString:URL_SOBRE];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
 
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [progress stopAnimating];
}

@end
