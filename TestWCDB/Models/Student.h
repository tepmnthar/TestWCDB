//
//  Student.h
//  TestWCDB
//
//  Created by tepmnthar on 07/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"
@interface Student : NSObject
@property (nonatomic) NSInteger ID;
@property (nonatomic) NSString* name;
@property (nonatomic) NSInteger teacherID;

@property (nonatomic) Teacher* teacher;
@end
