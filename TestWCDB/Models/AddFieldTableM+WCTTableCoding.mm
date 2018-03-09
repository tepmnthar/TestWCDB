//
//  AddFieldTableM+WCTTableCoding.m
//  TestWCDB
//
//  Created by tepmnthar on 09/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "AddFieldTableM+WCTTableCoding.h"

@implementation AddFieldTableM (WCTTableCoding)

WCDB_IMPLEMENTATION(AddFieldTableM)

WCDB_SYNTHESIZE(AddFieldTableM, ID)
WCDB_SYNTHESIZE(AddFieldTableM, first)
WCDB_SYNTHESIZE(AddFieldTableM, second)

WCDB_PRIMARY(AddFieldTableM, ID)

@end
