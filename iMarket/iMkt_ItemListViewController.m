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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
  /* Create custom view to display section header... */
  UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
  [label setFont:[UIFont boldSystemFontOfSize:12]];
  NSString *title;
  if (section == 0) {
    title = @"To Buy";
  } else {
    title= @"In Kart";
  }
  /* Section header is in 0th index... */
  [label setText:title];
  [view addSubview:label];
  [view setBackgroundColor: [UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]]; //your background color...
  return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSPredicate *notChecked = [NSPredicate predicateWithFormat:@"checked == NO"];
  NSPredicate *checked = [NSPredicate predicateWithFormat:@"checked == YES"];
  switch (section) {
    case 0:
      return [[_list.listItems filteredArrayUsingPredicate:notChecked] count];
      break;
      
    case 1:
      return [[_list.listItems filteredArrayUsingPredicate:checked] count];
      break;
      
    default:
      return 0;
      break;
  }
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
