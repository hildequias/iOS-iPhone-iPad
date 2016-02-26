//
//  CenterViewController.m
//  SlideOverMenu
//
//  Created by Carlos Irano on 24/04/15.
//  Copyright (c) 2015 Carlos Irano. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@property (nonatomic, strong) NSMutableArray *menuOptions;
@property (retain, nonatomic) IBOutlet UITableView *table;

- (IBAction)puppiesTapped:(UIButton *)sender;
- (void)animalSelected;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@implementation MenuViewController

- (instancetype)init {

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Menu" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:@"MenuViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.table registerClass:UITableViewCell.class forCellReuseIdentifier:@"UITableViewCell"];
    
    // carrega as opções de menu
    self.menuOptions = [[NSMutableArray alloc] initWithObjects:@"Saldo", @"Pagamentos", @"Transferencia", nil];
    
    self.table.delegate = self;
    self.table.dataSource = self;
    
    // cria transparencia e tira linhas da tabela
    self.table.backgroundColor = [UIColor clearColor];
    self.table.separatorColor = [UIColor clearColor];
    [self.view insertSubview:self.table atIndex:1];
}


// MARK: Button actions

- (IBAction)puppiesTapped:(UIBarButtonItem *)sender {
    [self.delegate toggleRightPanel];
}

- (void)fechaOmenuComDedo {
    [self.delegate collapseSidePanels2];
}

// abre o menu arrastando dedo para direita
- (void)animalSelected {
    [self.delegate collapseSidePanels];
}

// abre e fecha o menu pelo toque do botão
- (void)abreOufechaMenu {
    [self.delegate toggleRightPanel];
}


// MARK: Table view delegate

// cria uma unica linha na tabela
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return 1;
    return self.menuOptions.count;
}

// cria as celulas dentro da sessão
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // crio o objeto de celula que será devolvido e associo a interface que eu criei no storyboard com o nome idCelula
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    NSString *name = self.menuOptions[indexPath.row];
    
    // coloca o nome no label da celula
    cell.textLabel.text = name;
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    //cell.imageView.image = [UIImage imageNamed:name];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

// o que ocorre quando um item de menu é selecionado
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //if (indexPath.row == 0) {
        [self.delegate carregaItemDoMenu];
    //}
    
   //[self showViewController:viewcontroller sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
