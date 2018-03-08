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
#import "Teacher+WCTTableCoding.h"
#import "Room+WCTTableCoding.h"

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

+ (BOOL)createTeacherTable {
    BOOL flag = [self.database createTableAndIndexesOfName:@"teacher"
                                                 withClass:Teacher.class];
    return flag;
}
+ (BOOL)createTeacher:(Teacher *)teacher {
    BOOL flag = [self.database insertObject:teacher into:@"teacher"];
    return flag;
}
+ (BOOL)deleteAllTeacher {
    BOOL flag = [self.database deleteAllObjectsFromTable:@"teacher"];
    return flag;
}
+ (BOOL)createRoomTable {
    BOOL flag = [self.database createTableAndIndexesOfName:@"room"
                                                 withClass:Room.class];
    return flag;
}
+ (BOOL)createRoom:(Room *)room {
    BOOL flag = [self.database insertObject:room into:@"room"];
    return flag;
}
+ (BOOL)deleteAllRoom {
    BOOL flag = [self.database deleteAllObjectsFromTable:@"room"];
    return flag;
}
+ (void)multiSelectWithTeacher:(Teacher *)teacher {
    WCTPropertyList selection;
    for (const WCTProperty& property : Student.AllProperties) {
        selection.push_back(property.inTable(@"student"));
    }
    for (const WCTProperty& property : Teacher.AllProperties) {
        selection.push_back(property.inTable(@"teacher"));
    }
    WCTMultiSelect* multiSelect = [[self.database prepareSelectMultiObjectsOnResults:selection
                                                                          fromTables:@[@"student", @"teacher"]]
                                   where:Teacher.ID.inTable(@"teacher") == teacher.ID && Student.teacherID.inTable(@"student") == teacher.ID];
    WCTMultiObject* multiObject;
    while ((multiObject = [multiSelect nextMultiObject])) {
        Student* student = (Student*)[multiObject objectForKey:@"student"];
        Teacher* teacher = (Teacher*)[multiObject objectForKey:@"teacher"];
    }
}
@end
