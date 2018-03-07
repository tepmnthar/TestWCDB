//
//  ParallelTests.m
//  TestWCDBTests
//
//  Created by tepmnthar on 07/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SQL.h"

@interface ParallelTests : XCTestCase

@end

@implementation ParallelTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    {
        [SQL createStudentTable];
        [SQL deleteAllStudents];
    }
}

- (void)testReadWrite {
    void(^anonymous)(void) = ^{
        dispatch_queue_t q1 = dispatch_queue_create("q1", NULL);
        dispatch_queue_t q2 = dispatch_queue_create("q2", NULL);
        dispatch_async(q1, ^{
            for (int i = 0; i < 100000; i++) {
                Student* student = [[Student alloc] init];
                student.ID = i;
                student.name = [NSString stringWithFormat:@"%d", i];
                [SQL createStudent:student];
                NSLog(@"insert: %d", i);
            }
        });
        dispatch_async(q2, ^{
            for (int i = 99999; i >= 0; i--) {
                Student* student = [[Student alloc] init];
                student.ID = i;
                Student* findStudent = [SQL retreiveStudent:student];
                if (findStudent) {
                    NSLog(@"hit: %d", i);
                } else {
                    NSLog(@"miss: %d", i);
                }
            }
        });
    };
    XCTAssertNoThrow(anonymous());
}

- (void)testReadWriteAnother {
    void(^anonymous)(void) = ^{
        dispatch_queue_t q1 = dispatch_queue_create("q1", NULL);
        dispatch_queue_t q2 = dispatch_queue_create("q2", NULL);
        for (int i = 0; i < 100000; i++) {
            dispatch_async(q1, ^{
                Student* student = [[Student alloc] init];
                student.ID = i;
                student.name = [NSString stringWithFormat:@"%d", i];
                [SQL createStudent:student];
                NSLog(@"insert: %d", i);
            });
            
        }
        for (int i = 99999; i >= 0; i--) {
            dispatch_async(q2, ^{
                Student* student = [[Student alloc] init];
                student.ID = i;
                Student* findStudent = [SQL retreiveStudent:student];
                if (findStudent) {
                    NSLog(@"hit: %d", i);
                } else {
                    NSLog(@"miss: %d", i);
                }
            });
            
        }
    };
    XCTAssertNoThrow(anonymous());
}


@end
