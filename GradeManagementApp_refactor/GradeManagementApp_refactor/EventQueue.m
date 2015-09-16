//
//  EventQueue.m
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "EventQueue.h"

@implementation EventQueue
{
    NSMutableArray *mEvents;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mEvents = [[NSMutableArray alloc] init];

    }
    
    return self;
}

- (void)enEventQueue:(Event *)event
{
    [mEvents addObject:event];
}

- (Event *)deEventQueue
{
    Event *event = [[mEvents firstObject] retain];
    
    if (event)
    {
        [mEvents removeObjectAtIndex:0];
    }
    
    return [event autorelease];
}

- (void)dealloc
{
    [mEvents release];
    [super dealloc];
}

@end
