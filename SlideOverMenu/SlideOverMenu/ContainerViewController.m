//
//  ContainerViewController.m
//  SlideOverMenu
//
//  Created by Carlos Irano on 26/04/15.
//  Copyright (c) 2015 Carlos Irano. All rights reserved.
//

#import "ContainerViewController.h"
#import "SidePanelViewController.h"
#import "MenuViewController.h"
#import "ViewController.h"

@interface ContainerViewController ()

@property (nonatomic, strong) MenuViewController *centerViewController;
@property (nonatomic, assign) SlideOutState currentState;
@property (nonatomic, strong) SidePanelViewController *rightViewController;
@property (nonatomic, assign) CGFloat centerPanelExpandedOffset;
@property (nonatomic, assign) CGFloat tamanhoDaBarraNavegacao;

@property (nonatomic, strong) UIBlurEffect *blurEffect;
@property (nonatomic, strong) UIVisualEffectView *blurView;

@property (nonatomic, assign) NSInteger numero;

- (void)setupRightPanel;
- (void)addRightPanelViewController;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _numero = 9000;
    
    self.currentState = BothCollapsed;
    
    // limite do eixo X para que o menu deslize
    self.centerPanelExpandedOffset = 40; //CGRectGetWidth(self.view.frame) / 5;
    
    self.centerViewController = [[MenuViewController alloc] init];
    
    self.centerViewController.delegate = self;
    self.centerViewController.centerPanelExpandedOffset = self.centerPanelExpandedOffset;
    
    [self.view addSubview:self.centerViewController.view];
    [self addChildViewController:self.centerViewController];
    
    [self.centerViewController didMoveToParentViewController:self];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self.centerViewController.view addGestureRecognizer:panGestureRecognizer];
    
    [self setupRightPanel];
}

#pragma mark - View Configuration

// esconde 100% da view que compoe o menu
- (void)setupRightPanel {
    
    [self addRightPanelViewController];
    self.currentState = RightPanelExpanded;
    self.tamanhoDaBarraNavegacao = self.rightViewController.navigationController.navigationBar.frame.size.height +20;
    
    // ajusta o menu lateral com base nas dimensões da tela do dispositivo
    CGRect rect = self.centerViewController.view.frame;
    rect.origin.x = -CGRectGetWidth(self.centerViewController.view.frame);
    rect.origin.y =  self.tamanhoDaBarraNavegacao;
    rect.size.width = rect.size.width*0.45;
    rect.size.height = rect.size.height - self.tamanhoDaBarraNavegacao;
    self.centerViewController.view.frame = rect;
    
    // efeito de blur e transparencia no fundo da tabela
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [blurView setFrame:self.centerViewController.view.bounds];
    [self.centerViewController.view insertSubview:blurView atIndex:0];
}

// constroi a view controller da home na primeira execução
- (void)addRightPanelViewController {
    
    if (self.rightViewController == nil) {
    
        self.rightViewController = [[SidePanelViewController alloc] init];
        [self addChildSidePanelController:self.rightViewController];
    }
}

- (void)addChildSidePanelController: (SidePanelViewController*)sidePanelController {
    
    sidePanelController.delegate = self.centerViewController;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sidePanelController];
    
    [self.view insertSubview:nav.view atIndex:0];
    
    [self addChildViewController:nav];
    [nav didMoveToParentViewController:self];
}

#pragma mark - Menu Actions
- (void)carregaItemDoMenu {
    
    // constroi view que vai carregar item selecionado
    ViewController *vcItem = [[ViewController alloc] init];
    vcItem.view.tag = _numero; //9001
    
    // anima item selecionado
    //[self adicionaView:vcItem];
    
    [self animateRightPanel:YES completion:nil];
    [self.rightViewController.navigationController pushViewController:vcItem animated:YES];
    
    return;
    
    
    NSArray *subviews = self.rightViewController.view.subviews;
    //BOOL achou = FALSE;
    for (UIView *view in subviews) {
        
        if (view.tag == _numero -1) { //9000
            
            [view removeFromSuperview];

//            //achou = TRUE;
//            
//            //__weak typeof(self) weakSelf = self;
//            [self animateRightPanel:YES completion:^(BOOL finished) {
//            //    __strong typeof(weakSelf) self = weakSelf;
//                
//                //[self animacaoItemMenu:view completion:nil];
//                
//                [view removeFromSuperview];
//                [self performSelector:@selector(carregaItemDoMenu) withObject:nil afterDelay:0.2];
//            }];
        }
    }
    
    _numero = _numero + 1;
    
//    if (!achou) {
//        [self adicionaView:vcItem];
//        _numero = _numero + 1;
//    }
}

#pragma mark - Utils

- (void)adicionaView:(UIViewController *)vcItem {
    
//    NSArray *subviews = self.rightViewController.view.subviews;
//NSLog(@"%@",subviews);
    
    [self.rightViewController.view addSubview:vcItem.view];
    [self.rightViewController addChildViewController:vcItem];
    
    // com stack
    //[self.rightViewController.navigationController pushViewController:vcItem animated:YES];
    // sem stack
    //self.rightViewController.navigationController.viewControllers = @[vcItem];
    
    //[vcItem didMoveToParentViewController:self.rightViewController];
    
    // posiciona a view para deslocar
    CGRect rect = CGRectMake(-vcItem.view.frame.size.width,
                             vcItem.view.frame.origin.y,
                             vcItem.view.frame.size.width,
                             vcItem.view.frame.size.height);
    [vcItem.view setFrame:rect];
    
    //NSLog(@"%@",[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2]);
    
    // testar aqui se o menu tá aberto mesmo
    // algo assim -> hasMovedGreaterThanHalfway = (recognizer.view.center.x - 90) < 0;
    
    [self animateRightPanel:YES
                 completion:^(BOOL finished) {
                     [self animacaoItemMenu:vcItem.view completion:nil];
                 }];
    
    //NSLog(@"depois %d", self.rightViewController.childViewControllers.count);
}



// entra primeiro neste metodo para fechar ou esconder o menu quando o ação é disparada pelo botão ou movimento de dedo na home
- (void)collapseSidePanels {
    switch (self.currentState) {
        // se o menu estiver fechado
        case RightPanelExpanded:
            [self toggleRightPanel];
            break;

        default:
            break;
    }
}

- (void)collapseSidePanels2 {
    switch (self.currentState) {
        
        case RightPanelExpanded:
            break;
        
        // se o menu estiver aberto
        default:
            [self toggleRightPanel];
            break;
    }
}

- (void)toggleRightPanel {
    BOOL notAlreadyExpanded;
    notAlreadyExpanded = (self.currentState != RightPanelExpanded);
    
    // se o menu estiver fechado constroi a view controller da home
    if (notAlreadyExpanded) {
        [self addRightPanelViewController];
    }
    
    // expandi ou recolhe o menu
    [self animateRightPanel:notAlreadyExpanded completion:nil];
}

#pragma mark - Animações

- (void)animacaoItemMenu:(UIView *)itemView completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         CGRect tPos = itemView.frame;
                         tPos.origin.x = 0;
                         itemView.frame = tPos;
                     }
                     completion:completion];
}

- (void)animacaoRemoveView:(UIView *)itemView completion:(void (^)(BOOL finished))completion {
    
    [UIView animateWithDuration:0.0
                          delay:0
         usingSpringWithDamping:0.0
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
//                         CGRect tPos = itemView.frame;
//                         tPos.origin.x = -itemView.frame.size.width;
//                         itemView.frame = tPos;
                     }
                     completion:completion];
}

// anima o menu para expandir e recolher
- (void)animateRightPanel:(BOOL)shouldExpand completion:(void (^)(BOOL finished))completion {
    
    // recolhe o menu se ele estiver expandido
    if (shouldExpand) {
        self.currentState = RightPanelExpanded;
        
        [self animateCenterPanelXPosition:-CGRectGetWidth(self.centerViewController.view.frame)
                               completion:completion];
        
        // --> somente iPhone [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    // expande o menu
    } else {
        self.currentState = BothCollapsed;
        [self animateCenterPanelXPosition:-self.centerPanelExpandedOffset
           completion:nil];
    }
    
    // esmaece a tela quando o menu aparece
    [self animaEsmaecimentoDaTela:(!shouldExpand)];
}

- (void)animateCenterPanelXPosition:(CGFloat)targetPosition completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        
        CGRect tPos = self.centerViewController.view.frame;
        tPos.origin.x = targetPosition;
        self.centerViewController.view.frame = tPos;
    }
                     completion:completion];
}

- (void)animaEsmaecimentoDaTela:(BOOL)flag {
    
    if (flag) {
        self.blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        self.blurView = [[UIVisualEffectView alloc] initWithEffect:self.blurEffect];
        
        // medidas da caixa blur
        CGRect rect = CGRectMake(self.rightViewController.view.frame.origin.x,
                                 self.tamanhoDaBarraNavegacao,
                                 self.rightViewController.view.frame.size.width,
                                 self.rightViewController.view.frame.size.height);

        [self.blurView setFrame:rect];
        
        // cria o blur na tela ao exibir o menu
        [UIView transitionWithView:self.rightViewController.view
                          duration:0.5
                           options:UIViewAnimationOptionTransitionCrossDissolve
        animations:^{
            [self.rightViewController.view addSubview:self.blurView];
        } completion:nil];
        
        // tira o esmaecimento quando o menu recolhe
    }
    else {
        
//        // tira o blur da tela
//        [UIView transitionWithView:self.rightViewController.view
//                          duration:0.5
//                           options:UIViewAnimationOptionTransitionCrossDissolve
//        animations:^{
//            [self.blurView removeFromSuperview];
//        } completion:nil];
        
        [self.blurView removeFromSuperview];
//        self.blurView = nil;
    }
}

#pragma mark - Menu Pan Gesture

- (void)handlePanGesture: (UIPanGestureRecognizer*)recognizer {
    // determina o que o usuario esta revelando a esquerda ou direita do painel pela direção do gesto
    BOOL hasMovedGreaterThanHalfway;
    BOOL gestureIsDraggingFromLeftToRight;

    CGFloat valorLimitePuxadaDoMenu = CGRectGetWidth(self.centerViewController.view.frame) *0.4;
    
    gestureIsDraggingFromLeftToRight = ([recognizer velocityInView:self.view].x) > 0;
    hasMovedGreaterThanHalfway = (recognizer.view.center.x - 90) < 0;
    
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            if (self.currentState == BothCollapsed) {
                if (!gestureIsDraggingFromLeftToRight) {
                    [self collapseSidePanels];
                }
            }
            break;
            
        case UIGestureRecognizerStateChanged:
            if (recognizer.view.center.x < valorLimitePuxadaDoMenu) {
                recognizer.view.center = CGPointMake(recognizer.view.center.x + [recognizer translationInView:self.view].x,
                                                     recognizer.view.center.y);
                [recognizer setTranslation:CGPointZero inView:self.view];
            }
            break;
            
        case UIGestureRecognizerStateEnded:
            [self animateRightPanel:hasMovedGreaterThanHalfway completion:nil];
            break;
            
        default:
            break;
    }
}

@end

