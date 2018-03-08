//
//  Student+WCTTableCoding.m
//  TestWCDB
//
//  Created by tepmnthar on 07/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "Student+WCTTableCoding.h"

@implementation Student (WCTTableCoding)

WCDB_IMPLEMENTATION(Student)

WCDB_SYNTHESIZE(Student, ID)
WCDB_SYNTHESIZE(Student, name)
WCDB_SYNTHESIZE(Student, teacherID)

WCDB_PRIMARY(Student, ID)

WCDB_INDEX(Student, "_index", name)

@end
