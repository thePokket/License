//
//  InsertViewController.h
//  LicenseRegistration
//
//  Created by Student-003 on 02/04/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbWrapper.h"

@interface InsertViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *ID;
@property (strong, nonatomic) IBOutlet UITextField *Name;
@property (strong, nonatomic) IBOutlet UITextField *City;
@property (strong, nonatomic) IBOutlet UITextField *DOB;
@property (strong, nonatomic) IBOutlet UITextField *Gender;
@property (strong, nonatomic) IBOutlet UITextField *Contact;
- (IBAction)btnInsert:(id)sender;

@end
