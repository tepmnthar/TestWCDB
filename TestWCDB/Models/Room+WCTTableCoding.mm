//
//  Room+WCTTableCoding.m
//  TestWCDB
//
//  Created by tepmnthar on 07/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "Room+WCTTableCoding.h"

@implementation Room (WCTTableCoding)

WCDB_IMPLEMENTATION(Room)

WCDB_SYNTHESIZE(Room, ID)
WCDB_SYNTHESIZE(Room, address)

WCDB_PRIMARY(Room, ID)

WCDB_INDEX(Room, "_index", ID)

@end
