//
//  SobreViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "SobreViewController.h"

#define URL_SOBRE @"http://www.livroiphone.com.br/carros/sobre.htm"

@implementation SobreViewController

@synthesize webView, progress;

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Título
    self.title = @"Sobre";
    
    // Inicia a animação do activity indicator
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.progress startAnimating];
    
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
