//
//  AddFieldTable+WCTTableCoding.m
//  TestWCDB
//
//  Created by tepmnthar on 09/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "AddFieldTable+WCTTableCoding.h"

@implementation AddFieldTable (WCTTableCoding)

WCDB_IMPLEMENTATION(AddFieldTable)

WCDB_SYNTHESIZE(AddFieldTable, ID)
WCDB_SYNTHESIZE(AddFieldTable, first)

WCDB_PRIMARY(AddFieldTable, ID)


@end
