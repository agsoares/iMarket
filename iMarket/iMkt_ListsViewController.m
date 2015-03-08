//
//  iMkt_ListsViewController.m
//  iMarket
//
//  Created by Adriano Soares on 06/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "iMkt_ListsViewController.h"
#import "iMkt_ItemListViewController.h"

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
  [self performSegueWithIdentifier:@"ItemListSegue" sender:indexPath];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:@"ItemListSegue"] ) {
    NSIndexPath *indexPath = (NSIndexPath *)sender;
    iMkt_ItemListViewController *dvc = (iMkt_ItemListViewController *)segue.destinationViewController;
    dvc.list = [_lists objectAtIndex:indexPath.row];
  }
  
  
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}




@end
