//
//  MyLine.m
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 24..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "MyLine.h"

@implementation MyLine
{
    MyPoint *mStart;
    MyPoint *mEnd;
}


@synthesize start = mStart;
@synthesize end = mEnd;


+ (instancetype)lineWithStartPoint:(MyPoint *)start endPoint:(MyPoint *)end
{
    return [[self alloc] initWithStartPoint:start endPoint:end];
}


- (instancetype)initWithStartPoint:(MyPoint *)start endPoint:(MyPoint *)end
{
    self = [super init];
    
    if (self)
    {
        mStart = start;
        mEnd = end;
    }
    
    return self;
}




@end
