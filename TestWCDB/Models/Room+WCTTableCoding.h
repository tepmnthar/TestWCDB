//
//  Room+WCTTableCoding.h
//  TestWCDB
//
//  Created by tepmnthar on 07/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "Room.h"
#import <WCDB/WCDB.h>

@interface Room (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(ID)
WCDB_PROPERTY(address)

@end
