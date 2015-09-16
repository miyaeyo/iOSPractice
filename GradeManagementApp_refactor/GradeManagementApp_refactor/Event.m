//
//  Event.m
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Event.h"

@implementation Event
{
    NSString *mKey;
    id mValue;
}


@synthesize key = mKey;
@synthesize value = mValue;


+ (instancetype)eventWithKey:(NSString *)key value:(id)value
{
    return [[[self alloc] initWithKey:key value:value] autorelease];
}


- (instancetype)initWithKey:(NSString *)key value:(id)value
{
    self = [super init];
    
    if (self)
    {
        mKey = [key retain];
        mValue = [value retain];
    }
    
    return self;
}


- (void)dealloc
{
    [mKey release];
    [mValue release];
    
    [super dealloc];
}


@end
