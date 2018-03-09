//
//  EncryptTest.m
//  TestWCDBTests
//
//  Created by tepmnthar on 09/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "SQL.h"

@interface EncryptTest : XCTestCase

@end

@implementation EncryptTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEncrypt {
    [SQL encryptSQL];
}
@end
