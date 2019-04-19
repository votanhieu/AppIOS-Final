//
//  ModelManager.h
//  DataBaseDemo
//
//  Created by TheAppGuruz-New-6 on 22/02/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import "ModelDiemStudent.h"
#import "FMDatabase.h"
#import "Util.h"

@interface ModelManager : NSObject

@property (nonatomic,strong) FMDatabase *database;

+(ModelManager *) getInstance;
-(NSMutableArray *) getData;
-(Model *) getStudentByID:(NSString *)rollnum;
-(NSMutableArray *) getDataOrderByDESC;
-(NSMutableArray *) getDataBySubject:(NSString *)subject;
-(void)insertDiem:(NSString *)rollnum idmon:(NSString *)idmon diem:(NSString *)diem;
-(void)insertData:(Model *)data;
-(void)updateData:(Model *)data;
-(void)deleteData:(Model *)data;
-(void)deleteAll;

@end
