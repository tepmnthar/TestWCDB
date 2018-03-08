//
//  CascadeTests.m
//  TestWCDBTests
//
//  Created by tepmnthar on 08/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SQL.h"
#import "Student.h"
#import "Teacher.h"

@interface CascadeTests : XCTestCase

@end

@implementation CascadeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    {
        [SQL createStudentTable];
        [SQL deleteAllStudents];
        
        [SQL createTeacherTable];
        [SQL deleteAllTeacher];
        
        [SQL createRoomTable];
        [SQL deleteAllRoom];
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCascadeSelect {
    for (int i = 0; i < 10; i++) {
        Teacher* teacher = [[Teacher alloc] init];
        teacher.ID = i;
        teacher.name = [NSString stringWithFormat:@"%d", i];
        int rand = arc4random_uniform(3);
        switch (rand) {
            case 0:
                teacher.subject = @"A";
                break;
            case 1:
                teacher.subject = @"B";
                break;
            case 2:
                teacher.subject = @"C";
                break;
            default:
                break;
        }
        [SQL createTeacher:teacher];
    }
    for (int i = 0; i < 100; i++) {
        Student* student = [[Student alloc] init];
        student.ID = i;
        student.name = [NSString stringWithFormat:@"%d", i];
        student.teacherID = i % 10;
        [SQL createStudent:student];
    }
    Teacher* teacher = [[Teacher alloc] init];
    teacher.ID = 0;
    [SQL multiSelectWithTeacher:teacher];
}


@end
