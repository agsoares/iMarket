//
//  iMkt_ListItem.m
//  iMarket
//
//  Created by Adriano Soares on 3/6/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "iMkt_ListItem.h"

@implementation iMkt_ListItem


+ (NSMutableArray *)loadItemsFromList:(iMkt_List *)list {
  NSMutableArray *items = [[NSMutableArray alloc] init];
  PFQuery *query = [PFQuery queryWithClassName:@"ListItem"];
  
  [query whereKey:@"listId" equalTo: list.object];
  NSMutableArray *queryResult = [NSMutableArray arrayWithArray:[query findObjects]];
  for (PFObject *obj in queryResult) {
    iMkt_ListItem *item = [[iMkt_ListItem alloc] init];
    item.name = [obj valueForKey:@"name"];
    item.checked = [(NSNumber *)[obj valueForKey:@"checked"] boolValue];
    item.quantity = [(NSNumber *)[obj valueForKey:@"quantity"] integerValue];
    item.object = obj;
    item.list = list;
    [items addObject:item];
  }
  return items;
}

- (iMkt_ListItem *)initWithName:(NSString *)name inList:(iMkt_List *)list
{
    self = [super init];
    if (self) {
      _list = list;
      _checked = NO;
      _quantity = 1;
      _name = name;
      [self save];
    }
    return self;
}

-(void)save {
  PFObject *item = [PFObject objectWithClassName:@"ListItem"];
  item[@"name"] = _name;
  item[@"checked"] = [NSNumber numberWithBool:_checked];
  item[@"quantity"] = [NSNumber numberWithInteger:_quantity];
  
  [item saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    if (!error) {
      _object = item;
      PFRelation *relation = [item relationForKey:@"listId"];
      [relation addObject:_list.object];
      [item saveInBackground];
    }
  }];
}


-(void)update {}
@end
