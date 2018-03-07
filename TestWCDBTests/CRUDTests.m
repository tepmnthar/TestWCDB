//
//  CRUDTests.m
//  TestWCDBTests
//
//  Created by tepmnthar on 07/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SQL.h"

@interface CRUDTests : XCTestCase

@end

@implementation CRUDTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    {
        [SQL createStudentTable];
        [SQL deleteAllStudents];
    }
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
}

- (void)testCreate {
    {
        for (int i = 0; i < 100; i++) {
            Student* student = [[Student alloc] init];
            student.ID = i;
            student.name = [NSString stringWithFormat:@"%d", i];
            [SQL createStudent:student];
        }
        XCTAssertTrue([SQL retreiveStudents].count == 100);
    }
}
- (void)testReteive {
    {
        Student* student = [[Student alloc] init];
        student.ID = 0;
        student.name = @"0";
        [SQL createStudent:student];

        NSArray<Student*>* students = [SQL retreiveStudents];
        XCTAssertTrue([SQL retreiveStudents].count == 1);
    }
}
- (void)testUpdate {
    {
        for (int i = 0; i < 100; i++) {
            Student* student = [[Student alloc] init];
            student.ID = i;
            student.name = [NSString stringWithFormat:@"%d", i];
            [SQL createStudent:student];
        }

        Student* student = [[Student alloc] init];
        student.ID = 0;
        student.name = @"test";
        [SQL updateStudent:student];
        
        NSArray<Student*>* students = [SQL retreiveStudents];
        XCTAssertTrue([students[0].name isEqualToString:@"test"]);
    }
}
- (void)testDelete {
    {
        for (int i = 0; i < 100; i++) {
            Student* student = [[Student alloc] init];
            student.ID = i;
            student.name = [NSString stringWithFormat:@"%d", i];
            [SQL createStudent:student];
        }

        Student* student = [[Student alloc] init];
        student.ID = 0;
        student.name = @"anything";
        [SQL deleteStudent:student];
        XCTAssertTrue([SQL retreiveStudents].count == 99);
    }
}

@end
