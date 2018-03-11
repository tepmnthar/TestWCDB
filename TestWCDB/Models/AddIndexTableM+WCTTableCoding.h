//
//  AddIndexTableM+WCTTableCoding.h
//  TestWCDB
//
//  Created by tepmnthar on 11/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "AddIndexTableM.h"
#import <WCDB/WCDB.h>

@interface AddIndexTableM (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(ID)
WCDB_PROPERTY(first)

@end
