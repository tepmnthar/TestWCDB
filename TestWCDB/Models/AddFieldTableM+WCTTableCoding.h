//
//  AddFieldTableM+WCTTableCoding.h
//  TestWCDB
//
//  Created by tepmnthar on 09/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "AddFieldTableM.h"
#import <WCDB/WCDB.h>

@interface AddFieldTableM (WCTTableCoding) <WCTTableCoding>
WCDB_PROPERTY(ID)
WCDB_PROPERTY(first)
WCDB_PROPERTY(second)
@end
