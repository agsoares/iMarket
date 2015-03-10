//
//  iMkt_ListsViewController.m
//  iMarket
//
//  Created by Adriano Soares on 06/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "iMkt_ListsViewController.h"
#import "iMkt_ItemListViewController.h"
#import "iMkt_NewListViewController.h"

@interface iMkt_ListsViewController ()

@end

@implementation iMkt_ListsViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  _lists = [iMkt_List loadUserLists:_user];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_lists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *simpleTableIdentifier = @"ListNewCell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
  }
  
  cell.textLabel.text = [(iMkt_List *)[self.lists objectAtIndex:indexPath.row] name];

  return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:NO];
  [self performSegueWithIdentifier:@"ItemListSegue" sender:indexPath];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"ItemListSegue"] ) {
    NSIndexPath *indexPath = (NSIndexPath *)sender;
    iMkt_ItemListViewController *dvc = (iMkt_ItemListViewController *)segue.destinationViewController;
    dvc.list = [_lists objectAtIndex:indexPath.row];
  }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
  return UITableViewCellEditingStyleDelete;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  [[_lists objectAtIndex:indexPath.row] deleteObject];
  [_lists removeObjectAtIndex:indexPath.row];
  [tableView reloadData];

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)createList:(UIStoryboardSegue *)segue {
  if ([segue.identifier isEqualToString:@"NewListUnwindSegue"]) {
    
    iMkt_NewListViewController *vc = (iMkt_NewListViewController *) segue.sourceViewController;
    if ([vc.nameOfList length] > 0) {
      
      iMkt_List *newList = [[iMkt_List alloc] initWithName:vc.nameOfList andUser:_user];
      [_lists addObject:newList];
      [_tableView reloadData];
    }
    
  }
}


@end
