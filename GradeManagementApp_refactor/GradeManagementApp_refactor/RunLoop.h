//
//  EventLoop.h
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventQueue.h"
#import "Event.h"
#import "Application.h"

@interface RunLoop : NSObject

@property (nonatomic, readonly) EventQueue *eventQueue;
@property (nonatomic, readonly) Event *event;

- (void)run;

@end
