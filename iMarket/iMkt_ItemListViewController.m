//
//  iMkt_ItemListViewController.m
//  iMarket
//
//  Created by Adriano Soares on 3/8/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "iMkt_ItemListViewController.h"

@interface iMkt_ItemListViewController ()

@end

@implementation iMkt_ItemListViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  //[[iMkt_ListItem alloc] initWithName:@"Item 1" inList:_list];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_list.listItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *simpleTableIdentifier = @"ItemNewCell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
  
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
  }
  
  cell.textLabel.text = [(iMkt_List *)[self.list.listItems objectAtIndex:indexPath.row] name];
  
  return cell;
  
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