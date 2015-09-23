//
//  Recorder.m
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 22..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Recorder.h"


@implementation Recorder
{
    NSArray *lines;
}


- (void)dealloc
{
    [lines release];
    
    [super dealloc];
}


- (NSArray *)lines
{
    return lines;
}


- (void)setLines:(NSArray *)aLines
{
    [lines autorelease];
    lines = [aLines retain];
}


@end
