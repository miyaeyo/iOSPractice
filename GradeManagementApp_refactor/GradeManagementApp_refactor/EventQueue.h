//
//  EventQueue.h
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface EventQueue : NSObject

- (void)enEventQueue:(Event *)event;
- (Event *)deEventQueue;

@end
