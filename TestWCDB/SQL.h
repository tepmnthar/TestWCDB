//
//  SQL.h
//  TestWCDB
//
//  Created by tepmnthar on 07/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

@interface SQL : NSObject
+ (BOOL)deleteAllStudents;
+ (BOOL)createStudentTable;
+ (BOOL)createStudent:(Student*)student;
+ (BOOL)updateStudent:(Student*)student;
+ (NSArray<Student *>*)retreiveStudents;
+ (Student*)retreiveStudent:(Student*)student;
+ (BOOL)deleteStudent:(Student*)student;
@end
