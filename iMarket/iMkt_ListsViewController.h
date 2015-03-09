//
//  iMkt_ListsViewController.h
//  iMarket
//
//  Created by Adriano Soares on 06/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "iMkt_List.h"

@interface iMkt_ListsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property PFUser *user;
@property NSMutableArray *lists;
@end
