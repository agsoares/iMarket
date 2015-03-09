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
    if ([_txtListName.text length] != 0)
    {
      _nameOfList = _txtListName.text;
      [self performSegueWithIdentifier:@"NewListUnwindSegue" sender:sender];
    }
    else{
        UIAlertView *alertEmptyListNameField = [[UIAlertView alloc] initWithTitle:@"Empty list name" message:@"Please, insert a name for your list." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        [alertEmptyListNameField show];
    }
}

- (IBAction)hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual: _txtListName])
    {
        [self createNewList:nil];
    }
    
    return YES;
}

@end
