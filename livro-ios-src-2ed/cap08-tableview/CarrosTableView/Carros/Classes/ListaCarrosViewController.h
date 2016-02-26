//
//  ListaCarrosViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaCarrosViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *carros;

@end
