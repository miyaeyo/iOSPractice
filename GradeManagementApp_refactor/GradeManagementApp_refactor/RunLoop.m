//
//  EventLoop.m
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "RunLoop.h"


@implementation RunLoop
{
    EventQueue *mEventQueue;
    Event *mEvent;
}


@synthesize eventQueue = mEventQueue;
@synthesize event = mEvent;


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mEventQueue = [[EventQueue alloc] init];
    }
    
    return self;
}


- (void)run
{
    [[[Application sharedApplication] appDelegate] applicationDidBecomeActive];
    while (1)
    {
        @autoreleasepool
        {
            char input[10];
            printf("\ninput: ");
            scanf("%s", input);
            rewind(stdin);
            NSString *eventKey = [NSString stringWithUTF8String:input];
            
            mEvent = [Event eventWithKey:eventKey value:nil];
            [mEventQueue enEventQueue:mEvent];
            
            if ([eventKey isEqualToString:@"end"])
            {
                [[[Application sharedApplication] appDelegate] applicationWillTerminate];
                break;
            }
            else
            {
                [[Application sharedApplication] delegateEvent:[mEventQueue deEventQueue]];
            }
            
 
        }
    }
}


- (void)dealloc
{
    [mEventQueue removeObserver:self forKeyPath:@"count"];
    [mEventQueue release];
    [mEvent release];
    
    [super dealloc];
}


@end
