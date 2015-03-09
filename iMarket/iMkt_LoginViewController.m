//
//  iMkt_LoginViewController.m
//  iMarket
//
//  Created by Adriano Soares on 06/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "iMkt_LoginViewController.h"
#import "iMkt_ListsViewController.h"

@interface iMkt_LoginViewController () <UITextFieldDelegate>

@end

@implementation iMkt_LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) logingFunction{
    _user = [PFUser user];
    [PFUser logInWithUsernameInBackground:_username.text password:_password.text block:^(PFUser *user, NSError *error) {
        if (error) {
            NSLog(@"Login Fail!");
        } else {
            _user = user;
            [self performSegueWithIdentifier:@"LoginSegue" sender:nil];
        }
    }];
}

- (IBAction)login:(id)sender {
    [self logingFunction];
}

- (IBAction)returnKeyboard:(id)sender {
    [self.view endEditing:YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([textField isEqual:_username])
    {
        [_password becomeFirstResponder];
    }
    
    if([textField isEqual:_password])
    {
        [self logingFunction];
    }
    
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
  if ([segue.identifier isEqualToString:@"LoginSegue"] ) {
    UINavigationController *dnc = (UINavigationController *)segue.destinationViewController;
    iMkt_ListsViewController *lvc = (iMkt_ListsViewController *)([dnc viewControllers][0]);
    lvc.user = _user;
  }
}


-(IBAction)backToLoginView:(UIStoryboardSegue *)sender {
    
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
