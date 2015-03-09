//
//  iMkt_ListItem.h
//  iMarket
//
//  Created by Adriano Soares on 3/6/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "iMkt_List.h"

@interface iMkt_ListItem : NSObject
@property PFObject *object;
@property iMkt_List *list;
@property NSString *name;
@property BOOL checked;
@property NSInteger quantity;


+ (NSMutableArray *)loadItemsFromList:(iMkt_List *)list;
- (iMkt_ListItem *)initWithName:(NSString *)name inList:(iMkt_List *)list;

- (void)save;
- (void)update;


@end
