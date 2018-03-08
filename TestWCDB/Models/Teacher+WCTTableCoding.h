//
//  Teacher+WCTTableCoding.h
//  TestWCDB
//
//  Created by tepmnthar on 07/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "Teacher.h"
#import <WCDB/WCDB.h>

@interface Teacher (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(ID)
WCDB_PROPERTY(name)
WCDB_PROPERTY(subject)

@end
