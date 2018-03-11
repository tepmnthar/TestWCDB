//
//  AddIndexTable+WCTTableCoding.m
//  TestWCDB
//
//  Created by tepmnthar on 11/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "AddIndexTable+WCTTableCoding.h"

@implementation AddIndexTable (WCTTableCoding)

WCDB_IMPLEMENTATION(AddIndexTable)

WCDB_SYNTHESIZE(AddIndexTable, ID)
WCDB_SYNTHESIZE(AddIndexTable, first)

WCDB_PRIMARY(AddIndexTable, ID)

@end
