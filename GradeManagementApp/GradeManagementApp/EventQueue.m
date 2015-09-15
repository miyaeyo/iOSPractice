//
//  EventQueue.m
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "EventQueue.h"


@implementation EventQueue
{
    Event *mEvent;
}


@synthesize event = mEvent;


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mEvent = [[Event alloc] init];
    }
    
    return self;
}



- (void)dealloc
{
    [mEvent release];
    
    [super dealloc];
}

@end
