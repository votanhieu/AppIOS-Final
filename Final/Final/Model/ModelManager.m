//
//  ModelManager.m
//  DataBaseDemo
//
//  Created by TheAppGuruz-New-6 on 22/02/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

#import "ModelManager.h"
#import "Model.h"

@implementation ModelManager

static ModelManager *instance=nil;

@synthesize database=_database;

+(ModelManager *) getInstance{
    
    if(!instance)
    {
        instance=[[ModelManager alloc]init];
        instance.database=[FMDatabase databaseWithPath:[Util getFilePath:@"studentdb.sqlite"]];
    }
    return instance;
}
-(void)insertDiem:(NSString *)rollnum idmon:(NSString *)idmon diem:(NSString *)diem{
    [instance.database open];
    BOOL isInserted=[instance.database executeUpdate:@"INSERT INTO diem (rollnum,idmon,diem) VALUES (?,?,?)",rollnum,idmon,diem];
    [instance.database close];
    if(isInserted)
        NSLog(@"Inserted Successfully");
    else
        NSLog(@"Error occured while inserting");
}
-(void)insertData:(Model *)data{
    [instance.database open];
    BOOL isInserted=[instance.database executeUpdate:@"INSERT INTO studentInfo (rollnum,name,mail,birthday,sexy,phone,lop,address) VALUES (?,?,?,?,?,?,?,?)",data.rollnum,data.name,data.mail,data.birthday,data.sexy,data.phone,data.lop,data.address];
    [instance.database close];
    NSLog(@"%@-%@-%@-%@-%@-%@-%@",data.name,data.mail,data.birthday,data.sexy,data.phone,data.lop,data.address);
    if(isInserted)
        NSLog(@"Inserted Successfully");
    else
        NSLog(@"Error occured while inserting");
}
-(void)updateData:(Model *)data{
    [instance.database open];
    BOOL isUpdated=[instance.database executeUpdate:@"UPDATE studentInfo SET name=?, mail=?, birthday=?, sexy=?, lop=?, phone=?, address=? WHERE rollnum=?",data.name,data.mail,data.birthday,data.sexy,data.lop,data.phone,data.address,data.rollnum];
    [instance.database close];
    
    NSLog(@"UPDATE studentInfo SET name='%@', mail='%@', birthday='%@', sexy='%@', lop='%@', phone='%@', address='%@' WHERE rollnum='%@'",data.name,data.mail,data.birthday,data.sexy,data.phone,data.lop,data.address,data.rollnum);
    
    if(isUpdated)
        NSLog(@"Updated Successfully");
    else
        NSLog(@"Error occured while Updating");
}
-(void)deleteData:(Model *)data{
    [instance.database open];
    BOOL isDeleted=[instance.database executeUpdate:@"DELETE FROM studentInfo WHERE rollnum=?",data.rollnum];
    [instance.database close];
    
    if(isDeleted)
        NSLog(@"Deleted Successfully");
    else
        NSLog(@"Error occured while Deleting");
}
-(void)deleteAll{
    [instance.database open];
    BOOL isDeleted=[instance.database executeUpdate:@"DELETE FROM studentInfo"];
    [instance.database close];
    
    if(isDeleted)
        NSLog(@"Deleted All Successfully");
    else
        NSLog(@"Error occured while Deleting All");
}
-(NSMutableArray *)getData{
    NSMutableArray *studentGetAll = [[NSMutableArray alloc] init];
    [instance.database open];
    FMResultSet *resultSet=[instance.database executeQuery:@"SELECT * from studentInfo"];
    if(resultSet)
    {
        while([resultSet next]){
            Model *studentModel=[[Model alloc ]init];
            studentModel.rollnum= [resultSet stringForColumn:@"rollnum"];
            studentModel.name = [resultSet stringForColumn:@"name"];
            studentModel.mail = [resultSet stringForColumn:@"mail"];
            studentModel.birthday = [resultSet stringForColumn:@"birthday"];
            studentModel.sexy = [resultSet stringForColumn:@"sexy"];
            studentModel.phone = [resultSet stringForColumn:@"phone"];
            studentModel.lop = [resultSet stringForColumn:@"lop"];
            studentModel.address = [resultSet stringForColumn:@"address"];
            [studentGetAll addObject:studentModel];
        }
    }
    [instance.database close];
    return studentGetAll;
}
-(Model *) getStudentByID:(NSString *)rollnum{
    Model *aStudent = [[Model alloc] init];
    [instance.database open];
    FMResultSet *resultSet=[instance.database executeQuery:@"SELECT * from studentInfo WHERE rollnum=?",rollnum];
    if(resultSet)
    {
        while([resultSet next]){
            aStudent.rollnum = [resultSet stringForColumn:@"rollnum"];
            aStudent.name = [resultSet stringForColumn:@"name"];
            aStudent.mail = [resultSet stringForColumn:@"mail"];
            aStudent.birthday = [resultSet stringForColumn:@"birthday"];
            aStudent.sexy = [resultSet stringForColumn:@"sexy"];
            aStudent.phone = [resultSet stringForColumn:@"phone"];
            aStudent.lop = [resultSet stringForColumn:@"lop"];
            aStudent.address = [resultSet stringForColumn:@"address"];
        NSLog(@"%@", aStudent.rollnum);
        }
    }
    [instance.database close];
    return aStudent;
}
-(NSMutableArray *)getDataOrderByDESC{
    NSMutableArray *studentGetAll = [[NSMutableArray alloc] init];
    [instance.database open];
    FMResultSet *resultSet=[instance.database executeQuery:@"SELECT AVG(diem), studentInfo.rollnum,studentInfo.name , sexy FROM studentInfo, diem WHERE studentInfo.rollnum = diem.rollnum GROUP BY diem.rollnum ORDER BY AVG(diem) DESC"];
    if(resultSet)
    {
        while([resultSet next]){
            ModelDiemStudent *studentModel=[[ModelDiemStudent alloc ]init];
            studentModel.rollnum= [resultSet stringForColumn:@"rollnum"];
            studentModel.name = [resultSet stringForColumn:@"name"];
            studentModel.sexy = [resultSet stringForColumn:@"sexy"];
            studentModel.diem = [resultSet stringForColumn:@"AVG(diem)"];
            [studentGetAll addObject:studentModel];
        }
    }
    [instance.database close];
    return studentGetAll;
}
-(NSMutableArray *)getDataBySubject:(NSString *)myChoice{
    
    NSMutableArray *studentGetBySubject = [[NSMutableArray alloc] init];
    [instance.database open];
    
    NSString * idmonhoc = [[NSString alloc]init];
    if ([myChoice isEqualToString:@"math"])
    {
        idmonhoc = @"a";
    }
    if ([myChoice isEqualToString:@"physical"])
    {
        idmonhoc = @"b";
    }
    if ([myChoice isEqualToString:@"biological"])
    {
        idmonhoc = @"c";
    }
    if ([myChoice isEqualToString:@"english"])
    {
        idmonhoc = @"d";
    }
    if ([myChoice isEqualToString:@"chemistry"])
    {
        idmonhoc = @"e";
    }
    
    
    FMResultSet *resultSet=[instance.database executeQuery:@"SELECT AVG(diem), studentInfo.rollnum,studentInfo.name , sexy FROM studentInfo, diem WHERE studentInfo.rollnum = diem.rollnum AND idmon=? GROUP BY diem.rollnum ORDER BY AVG(diem) DESC",idmonhoc];

    if(resultSet)
    {
        while([resultSet next]){
            ModelDiemStudent *studentModel=[[ModelDiemStudent alloc ]init];
            studentModel.rollnum= [resultSet stringForColumn:@"rollnum"];
            studentModel.name = [resultSet stringForColumn:@"name"];
            studentModel.sexy = [resultSet stringForColumn:@"sexy"];
            studentModel.diem = [resultSet stringForColumn:@"AVG(diem)"];
            [studentGetBySubject addObject:studentModel];
            NSLog(@"student get by subject: rollnum: %@",studentModel.rollnum);
            NSLog(@"student get by subject: name: %@",studentModel.name );
            NSLog(@"student get by subject: sexy: %@",studentModel.sexy);
            NSLog(@"student get by subject: diem AVG: %@",studentModel.diem);
            
        }
    }
    [instance.database close];
    return studentGetBySubject;
}
@end
