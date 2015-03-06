//
//  iMkt_RegisterViewController.m
//  iMarket
//
//  Created by Adriano Soares on 06/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "iMkt_RegisterViewController.h"

@interface iMkt_RegisterViewController ()



@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation iMkt_RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)register:(id)sender {
  _user = [PFUser user];
  _user.username = _username.text;
  _user.password = _password.text;
  [_user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    if (error) {
      NSLog(@"Error");
      return;
    }
    
    if (succeeded) {
      // Tell app delegate that the user signed up successfully
      //[(TDAppDelegate *)[NSApp delegate] authSuccess];
      NSLog(@"Ok");
      return;
    }
  }];
}

-(IBAction)backToLoginView:(UIStoryboardSegue *)sender
{

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
