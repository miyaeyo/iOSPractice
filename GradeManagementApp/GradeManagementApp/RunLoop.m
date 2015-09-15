//
//  RunLoop.m
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "RunLoop.h"


@implementation RunLoop
{
    id mAppDelegate;
}


+ (instancetype)runLoopWithAppDelegate:(id)appDelegate
{
    return [[[self alloc] initWithAppDelegate:appDelegate] autorelease];
}


- (instancetype)initWithAppDelegate:(id)appDelegate
{
    self = [super init];
    
    if (self)
    {
        mAppDelegate = [[appDelegate alloc] init];
    }
    
    return self;
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"event"])
    {
        Event *event = [object valueForKey:keyPath];
        [mAppDelegate applicationReceivedEvent:event];
    }
    
}


- (void)dealloc
{
    [mAppDelegate release];
    
    [super dealloc];
}

@end
