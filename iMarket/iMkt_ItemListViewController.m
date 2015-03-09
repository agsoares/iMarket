//
//  iMkt_ItemListViewController.m
//  iMarket
//
//  Created by Adriano Soares on 3/8/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "iMkt_ItemListViewController.h"
#import "iMkt_ListItem.h"

@interface iMkt_ItemListViewController ()
@property NSArray *toBuy;
@property NSArray *inKart;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *txtNewItem;

@end

@implementation iMkt_ItemListViewController

- (void) ReloadArrays {
  NSPredicate *notChecked = [NSPredicate predicateWithFormat:@"checked == NO"];
  NSPredicate *checked = [NSPredicate predicateWithFormat:@"checked == YES"];
  _toBuy = [[NSArray alloc] initWithArray:[_list.listItems filteredArrayUsingPredicate:notChecked]];
  _inKart = [[NSArray alloc] initWithArray:[_list.listItems filteredArrayUsingPredicate:checked]];
}

- (IBAction)addItem:(id)sender {
  if (_txtNewItem.text.length > 0) {
    iMkt_ListItem *newItem = [[iMkt_ListItem alloc] initWithName:_txtNewItem.text inList:_list];
    [_list.listItems addObject:newItem];
    [self ReloadArrays];
    [_tableView reloadData];
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self ReloadArrays];
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
  switch (section) {
    case 0:
      return [_toBuy count];
      break;
      
    case 1:
      return [_inKart count];
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
  switch (indexPath.section) {
    case 0:
      cell.textLabel.text = [[_toBuy objectAtIndex:indexPath.row] name];
      break;
      
    case 1:
      cell.textLabel.text = [[_inKart objectAtIndex:indexPath.row] name];
      break;
  }
  
  return cell;
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  iMkt_ListItem *item;
  switch (indexPath.section) {
    case 0:
      item = [_toBuy objectAtIndex:indexPath.row];
      break;
    case 1:
      item = [_inKart objectAtIndex:indexPath.row];
      break;
  }
  item.checked = !item.checked;
  [self ReloadArrays];
  [_tableView reloadData];

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
