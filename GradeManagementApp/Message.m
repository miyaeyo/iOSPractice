//
//  Message.m
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 11..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Message.h"


@implementation Message
{
    Event *mEvent;
}

@synthesize event = mEvent;

+ (instancetype)messageWithEvent:(Event *)event
{
    return [[[Message alloc] initWithEvent:event] autorelease];
}

- (instancetype)initWithEvent:(Event *)event
{
    self = [super init];
    
    if(self)
    {
        mEvent = [event retain];
    }
    
    return self;
}

- (void)dealloc
{
    [mEvent release];
    
    [super dealloc];
}

@end
