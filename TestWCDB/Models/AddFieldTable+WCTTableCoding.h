//
//  AddFieldTable+WCTTableCoding.h
//  TestWCDB
//
//  Created by tepmnthar on 09/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "AddFieldTable.h"
#import <WCDB/WCDB.h>

@interface AddFieldTable (WCTTableCoding) <WCTTableCoding>
WCDB_PROPERTY(ID)
WCDB_PROPERTY(first)
@end
