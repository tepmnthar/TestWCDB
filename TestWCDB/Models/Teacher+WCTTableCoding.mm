//
//  Teacher+WCTTableCoding.m
//  TestWCDB
//
//  Created by tepmnthar on 07/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "Teacher+WCTTableCoding.h"

@implementation Teacher (WCTTableCoding)

WCDB_IMPLEMENTATION(Teacher)

WCDB_SYNTHESIZE(Teacher, ID)
WCDB_SYNTHESIZE(Teacher, name)
WCDB_SYNTHESIZE(Teacher, subject)

WCDB_PRIMARY(Teacher, ID)

WCDB_INDEX(Teacher, "_index", name)

@end
