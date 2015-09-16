//
//  ApplicationDelegate.h
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#ifndef GradeManagementApp_refactor_ApplicationDelegate_h
#define GradeManagementApp_refactor_ApplicationDelegate_h

#import "Event.h"

@protocol ApplicationDelegate <NSObject>


@required
- (void)applicationDidBecomeActive;
- (void)applicationReceivedEvent:(Event *)event;
- (void)applicationWillTerminate;

@end

#endif
