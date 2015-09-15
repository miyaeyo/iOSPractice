//
//  MyApplication.m
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "MyApplication.h"


@implementation MyApplication
{
    RunLoop       *mRunLoop;
    EventQueue *mEventQueue;
}


@synthesize eventQueue = mEventQueue;


+ (instancetype)MyApplicationMainWithAppDelegate:(id)appDelegate
{
    return [[[MyApplication alloc] initWithAppDelegate:appDelegate] autorelease];
}


- (instancetype)initWithAppDelegate:(id)appDelegate
{
    self = [super init];
    
    if (self)
    {
        mRunLoop = [RunLoop runLoopWithAppDelegate:appDelegate];
        mEventQueue = [[EventQueue alloc] init];
        
        [mEventQueue addObserver:mRunLoop
                      forKeyPath:@"event"
                         options:NSKeyValueObservingOptionNew context:NULL];
        
        
    }
    
    return self;
}


- (void)dealloc
{
    [mEventQueue removeObserver:mRunLoop forKeyPath:@"event"];
    [mEventQueue release];
    
    [super dealloc];
}

@end
