//
//  iMkt_NewListViewController.m
//  iMarket
//
//  Created by Jonathan Andrade on 06/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "iMkt_NewListViewController.h"

@implementation iMkt_NewListViewController

- (IBAction)createNewList:(id)sender {
  _nameOfList = _txtListName.text;
  [self performSegueWithIdentifier:@"NewListUnwindSegue" sender:sender];
}
@end
