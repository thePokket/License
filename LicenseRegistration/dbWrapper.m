//
//  dbWrapper.m
//  LicenseRegistration
//
//  Created by Student-003 on 02/04/18.
//  Copyright © 2018 felix. All rights reserved.
//

#import "dbWrapper.h"

@implementation dbWrapper

+(instancetype)getSharedObject
{
    
    static dbWrapper *obj;
    if(obj==Nil)
    {
        obj=[[dbWrapper alloc]init];
    }
    return obj;
    
}

-(NSString *)getDatabasePath
{
    
    NSArray *docDir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbPath=[[docDir firstObject] stringByAppendingString:@"/myDatabase.sqlite"];
    return dbPath;
    
}

-(BOOL)executeQuery:(NSString *)query
{

    BOOL success=NO;
    sqlite3_stmt *stmt=NULL;
    const char *CQuery=[query UTF8String];
    const char *databasePath=[[self getDatabasePath] UTF8String];
    if(sqlite3_open(databasePath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase,CQuery,-1,&stmt,nil)==SQLITE_OK)
        {
            if(sqlite3_step(stmt)==SQLITE_DONE)
            {
                success=YES;
                sqlite3_close(taskDatabase);
                sqlite3_finalize(stmt);
            }
            NSLog(@"Error in Step %s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
             NSLog(@"Error in prepare %s",sqlite3_errmsg(taskDatabase));
        }
    }
    else
    {
        NSLog(@"ERROR In Opening Database %s",sqlite3_errmsg(taskDatabase));
    }
    return success;
    
}

-(void)createTable
{

    NSString *createQuery=@"create table if not exists regTable(appID text, pName text, pCity text, pGender text, pContact text, pDOB text)";
    BOOL isSuccess=[self executeQuery:createQuery];
    if(isSuccess)
    {
        NSLog(@"Table Created");
    }
    else
    {
        NSLog(@"Table Not Created");
    }
    
}

-(void)getAllTask:(NSString *)query
{

    sqlite3_stmt *stmt=NULL;
    self.appIdArray=[[NSMutableArray alloc]init];
    self.pNameArray=[[NSMutableArray alloc]init];
    self.pCityArray=[[NSMutableArray alloc]init];
    self.pGenderArray=[[NSMutableArray alloc]init];
    self.pContactArray=[[NSMutableArray alloc]init];
    self.pDOBArray=[[NSMutableArray alloc]init];
    const char *CQuery=[query UTF8String];
    const char *databasePath=[[self getDatabasePath] UTF8String];
    if(sqlite3_open(databasePath, &taskDatabase)==SQLITE_OK)
    {
        if(sqlite3_prepare_v2(taskDatabase, CQuery, -1, &stmt, nil)==SQLITE_OK)
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
            {
                const unsigned char *appID=sqlite3_column_text(stmt, 0);
                const unsigned char *pName=sqlite3_column_text(stmt, 1);
                const unsigned char *pCity=sqlite3_column_text(stmt, 2);
                const unsigned char *pGender=sqlite3_column_text(stmt, 3);
                const unsigned char *pContact=sqlite3_column_text(stmt, 4);
                const unsigned char *pDOB=sqlite3_column_text(stmt, 5);
                NSString *aID=[NSString stringWithFormat:@"%s",appID];
                NSString *perName=[NSString stringWithFormat:@"%s",pName];
                NSString *perCity=[NSString stringWithFormat:@"%s",pCity];
                NSString *perGender=[NSString stringWithFormat:@"%s",pGender];
                NSString *perContact=[NSString stringWithFormat:@"%s",pContact];
                NSString *perDOB=[NSString stringWithFormat:@"%s",pDOB];
                [self.appIdArray addObject:aID];
                [self.pNameArray addObject:perName];
                [self.pCityArray addObject:perCity];
                [self.pGenderArray addObject:perGender];
                [self.pContactArray addObject:perContact];
                [self.pDOBArray addObject:perDOB];
            }
            if(self.appIdArray.count>0)
            {
                sqlite3_close(taskDatabase);
                sqlite3_finalize(stmt);
                NSLog(@"%@",self.appIdArray);
                NSLog(@"%@",self.pNameArray);
                NSLog(@"%@",self.pCityArray);
                NSLog(@"%@",self.pGenderArray);
                NSLog(@"%@",self.pContactArray);
                NSLog(@"%@",self.pDOBArray);
            }
            else
            {
                NSLog(@"Database Contains No Records %s",sqlite3_errmsg(taskDatabase));
            }
        }
        else
        {
            NSLog(@"Error In Prepare %s",sqlite3_errmsg(taskDatabase));
        }
    }
    else
    {
        NSLog(@"Error In Opening Database %s",sqlite3_errmsg(taskDatabase));
    }
}
@end
