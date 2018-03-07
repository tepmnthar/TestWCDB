//
//  Student+WCTTableCoding.h
//  TestWCDB
//
//  Created by tepmnthar on 07/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "Student.h"
#import <WCDB/WCDB.h>

@interface Student (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(ID)
WCDB_PROPERTY(name)

@end
