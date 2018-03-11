//
//  AddIndexTableM+WCTTableCoding.m
//  TestWCDB
//
//  Created by tepmnthar on 11/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "AddIndexTableM+WCTTableCoding.h"

@implementation AddIndexTableM (WCTTableCoding)

WCDB_IMPLEMENTATION(AddIndexTableM)

WCDB_SYNTHESIZE(AddIndexTableM, ID)
WCDB_SYNTHESIZE(AddIndexTableM, first)

WCDB_PRIMARY(AddIndexTableM, ID)
WCDB_INDEX(AddIndexTableM, "_index", first)

@end
