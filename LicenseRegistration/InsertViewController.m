//
//  InsertViewController.m
//  LicenseRegistration
//
//  Created by Student-003 on 02/04/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import "InsertViewController.h"

@interface InsertViewController ()

@end

@implementation InsertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnInsert:(id)sender
{
    
    NSString *insertQuery=[NSString stringWithFormat:@"insert into regTable(appID,pName,pCity,pGender,pContact,pDOB) values ('%@','%@','%@','%@','%@','%@')",self.ID.text,self.Name.text,self.City.text,self.Gender.text,self.Contact.text,self.DOB.text];
    BOOL isSuccess=[[dbWrapper getSharedObject]executeQuery:insertQuery];
    if(isSuccess)
    {
        NSLog(@"insert: Success");
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Insert: Failed");
    }
    
}
@end
