//
//  SQL.m
//  TestWCDB
//
//  Created by tepmnthar on 07/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "SQL.h"
#import <WCDB/WCDB.h>
#import "Student+WCTTableCoding.h"

static NSString* const DB_PATH = @"/main.db";

@implementation SQL
+ (WCTDatabase*)database {
    static WCTDatabase* staticDatabase;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString* documentPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
        NSString* fullPath = [documentPath stringByAppendingPathComponent:DB_PATH];
        staticDatabase = [[WCTDatabase alloc] initWithPath:fullPath];
    });
    return staticDatabase;
}
+ (BOOL)deleteAllStudents {
    BOOL flag = [self.database deleteAllObjectsFromTable:@"student"];
    return flag;
}
+ (BOOL)createStudentTable {
    BOOL flag = [self.database createTableAndIndexesOfName:@"student"
                                                 withClass:Student.class];
    
    return flag;
}
+ (BOOL)createStudent:(Student *)student {
    BOOL flag = [self.database insertObject:student into:@"student"];
    return flag;
}
+ (NSArray<Student *>*)retreiveStudents {
    NSArray<Student *>* students = [self.database getObjectsOfClass:Student.class
                                                          fromTable:@"student"
                                                            orderBy:Student.ID.order()];
    return students;
}
+ (Student *)retreiveStudent:(Student *)student {
    Student* ret = [self.database getObjectsOfClass:Student.class
                                              fromTable:@"student"
                                                  where:Student.ID == student.ID].firstObject;
    return ret;
}
+ (BOOL)updateStudent:(Student *)student {
    //    BOOL flag = [self.database updateAllRowsInTable:@"student"
    //                                    onProperty:Student.name
    //                                    withObject:student];
//    BOOL flag = [self.database updateAllRowsInTable:@"student"
//                                       onProperties:WCTPropertyList({Student.name})
//                                         withObject:student];
    BOOL flag = [self.database updateRowsInTable:@"student"
                                    onProperties:WCTPropertyList({Student.name})
                                      withObject:student
                                           where:Student.ID == student.ID];
    return flag;
}
+ (BOOL)deleteStudent:(Student *)student {
    BOOL flag = [self.database deleteObjectsFromTable:@"student"
                                                where:Student.ID == student.ID];
    return flag;
}
@end
