//
//  iMkt_List.m
//  iMarket
//
//  Created by Adriano Soares on 3/6/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "iMkt_List.h"
#import "iMkt_ListItem.h"

@implementation iMkt_List

+ (NSMutableArray *)loadUserLists:(PFUser *)user {
  NSMutableArray *lists = [[NSMutableArray alloc] init];
  
  PFQuery *query = [PFQuery queryWithClassName:@"List"];

  [query whereKey:@"userId" equalTo: user];
  NSMutableArray *queryResult = [NSMutableArray arrayWithArray:[query findObjects]];
  for (PFObject *obj in queryResult) {
    iMkt_List *list = [[iMkt_List alloc] init];
    list.name = [obj valueForKey:@"name"];
    list.user = user;
    list.object = obj;
    list.listItems = [iMkt_ListItem loadItemsFromList:list];
    [lists addObject:list];
  }
  return lists;
}


- (iMkt_List *)initWithName:(NSString *)name andUser:(PFUser *)user{
    self = [super init];
    if (self) {
      _user = user;
      _listItems = [[NSMutableArray alloc] init];
      _name = name;
      [self save];
    }
    return self;
}

- (void)save {
  PFObject *list = [PFObject objectWithClassName:@"List"];
  list[@"name"] = _name;
  [list saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    if (!error) {
      _object = list;
      PFRelation *relation = [list relationForKey:@"userId"];
      [relation addObject:_user];
      [list saveInBackground];
    }
  }];
}

- (void)update {


}
@end
