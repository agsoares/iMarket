//
//  iMkt_NewListViewController.h
//  iMarket
//
//  Created by Jonathan Andrade on 06/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iMkt_NewListViewController : UIViewController <UITextFieldDelegate>
@property NSString *nameOfList;
@property (weak, nonatomic) IBOutlet UITextField *txtListName;

@end
