//
//  ViewController.m
//  LicenseRegistration
//
//  Created by Student-003 on 02/04/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *selectQuery=@"select * from regTable";
    [[dbWrapper getSharedObject]getAllTask:selectQuery];
    NSLog(@"All Applicants Name= %@",[dbWrapper getSharedObject].pNameArray);
    if([dbWrapper getSharedObject].appIdArray.count>0)
    {
        self.taskIdArray=[dbWrapper getSharedObject].appIdArray;
        self.taskNameArray=[dbWrapper getSharedObject].pNameArray;
        self.taskCityArray=[dbWrapper getSharedObject].pCityArray;
        self.taskGenderArray=[dbWrapper getSharedObject].pGenderArray;
        self.taskContactArray=[dbWrapper getSharedObject].pContactArray;
        self.taskDOBArray=[dbWrapper getSharedObject].pDOBArray;
        self.myTableView.delegate=self;
        self.myTableView.dataSource=self;
    }
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{

    NSString *selectQuery=@"select * from regTable";
    [[dbWrapper getSharedObject]getAllTask:selectQuery];
    NSLog(@"All Applicants Name= %@",[dbWrapper getSharedObject].pNameArray);
    if([dbWrapper getSharedObject].appIdArray.count>0)
    {
        self.taskIdArray=[dbWrapper getSharedObject].appIdArray;
        self.taskNameArray=[dbWrapper getSharedObject].pNameArray;
        self.taskCityArray=[dbWrapper getSharedObject].pCityArray;
        self.taskGenderArray=[dbWrapper getSharedObject].pGenderArray;
        self.taskContactArray=[dbWrapper getSharedObject].pContactArray;
        self.taskDOBArray=[dbWrapper getSharedObject].pDOBArray;
        [self.myTableView reloadData];
    }
    else if([dbWrapper getSharedObject].appIdArray.count==0)
    {
        self.taskIdArray=[dbWrapper getSharedObject].appIdArray;
        self.taskNameArray=[dbWrapper getSharedObject].pNameArray;
        self.taskCityArray=[dbWrapper getSharedObject].pCityArray;
        self.taskGenderArray=[dbWrapper getSharedObject].pGenderArray;
        self.taskContactArray=[dbWrapper getSharedObject].pContactArray;
        self.taskDOBArray=[dbWrapper getSharedObject].pDOBArray;
        [self.myTableView reloadData];
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.taskNameArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *simpleTableIdentifier=@"cell";
    CustomCellTableViewCell *cell=(CustomCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell==nil)
    {
        NSArray *bund=[[NSBundle mainBundle]loadNibNamed:@"CustomCellTableViewCell" owner:self options:nil];
        cell=[bund objectAtIndex:0];
    }
    cell.Name.text=[self.taskNameArray objectAtIndex:indexPath.row+1];
    cell.city.text=[self.taskCityArray objectAtIndex:indexPath.row+1];
    cell.gender.text=[self.taskGenderArray objectAtIndex:indexPath.row+1];
    cell.contactNo.text=[self.taskContactArray objectAtIndex:indexPath.row+1];
    cell.DOB.text=[self.taskDOBArray objectAtIndex:indexPath.row+1];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addEntry:(id)sender
{
    
    InsertViewController *ivc=[self.storyboard instantiateViewControllerWithIdentifier:@"InsertViewController"];
    [self.navigationController pushViewController:ivc animated:YES];
    
}
@end
