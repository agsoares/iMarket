//
//  iMkt_List.h
//  iMarket
//
//  Created by Adriano Soares on 3/6/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface iMkt_List : NSObject
@property PFObject *object;
@property PFUser *user;
@property NSString *name;
@property NSMutableArray *listItems;

+ (NSMutableArray *) loadUserLists:(PFUser *)user;

- (iMkt_List *)initWithName:(NSString *)name andUser:(PFUser *)user;

- (void) save;
- (void) update;
@end
