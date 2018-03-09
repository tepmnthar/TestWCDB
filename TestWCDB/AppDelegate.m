//
//  AppDelegate.m
//  TestWCDB
//
//  Created by tepmnthar on 07/03/2018.
//  Copyright © 2018 tepmnthar. All rights reserved.
//

#import "AppDelegate.h"
#import "SQL.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    {
//        [SQL createStudentTable];
//        [SQL deleteAllStudents];
//    }
//    void(^anonymous)(void) = ^{
//        dispatch_queue_t q1 = dispatch_queue_create("q1", NULL);
//        dispatch_queue_t q2 = dispatch_queue_create("q2", NULL);
//        for (int i = 0; i < 100000; i++) {
//            dispatch_async(q1, ^{
//                Student* student = [[Student alloc] init];
//                student.ID = i;
//                student.name = [NSString stringWithFormat:@"%d", i];
//                [SQL transactionCreateStudent:student];
//                NSLog(@"insert: %d", i);
//            });
//            
//        }
//        for (int i = 99999; i >= 0; i--) {
//            dispatch_async(q2, ^{
//                Student* student = [[Student alloc] init];
//                student.ID = i;
//                Student* findStudent = [SQL transactionRetreiveStudent:student];
//                if (findStudent) {
//                    NSLog(@"hit: %d", i);
//                } else {
//                    NSLog(@"miss: %d", i);
//                }
//            });
//        }
//    };
//    anonymous();
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
