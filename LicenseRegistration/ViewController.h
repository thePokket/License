//
//  ViewController.h
//  LicenseRegistration
//
//  Created by Student-003 on 02/04/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbWrapper.h"
#import "CustomCellTableViewCell.h"
#import "InsertViewController.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)addEntry:(id)sender;

@property NSArray *taskIdArray;
@property NSArray *taskNameArray;
@property NSArray *taskCityArray;
@property NSArray *taskGenderArray;
@property NSArray *taskContactArray;
@property NSArray *taskDOBArray;
@end

