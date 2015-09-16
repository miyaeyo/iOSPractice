//
//  Application.m
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Application.h"

static Application *app;

@implementation Application
{
    RunLoop *mRunLoop;
    id <ApplicationDelegate> mAppDelegate;
    
}


@synthesize appDelegate = mAppDelegate;


+ (instancetype)sharedApplication
{
    @synchronized(self)
    {
        if (!app)
        {
            app = [[Application alloc] init];
        }
    }
    
    return app;
}


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mRunLoop = [[RunLoop alloc] init];
    }
    
    return self;
}


- (void)applicationMainWithAppDelegate:(Class)appDelegate
{
    mAppDelegate = [[appDelegate alloc] init];
    [mRunLoop run];
}


- (void)delegateEvent:(Event *)event
{
    [mAppDelegate applicationReceivedEvent:event];
}


- (void)dealloc
{
    [mRunLoop release];
    [mAppDelegate release];
    
    [super dealloc];
}


@end
