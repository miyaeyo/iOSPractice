//
//  Line.m
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 21..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Line.h"

@implementation Line
{
    CGPoint mStart;
    CGPoint mEnd;
}


@synthesize start = mStart;
@synthesize end = mEnd;


+ (instancetype)lineWithStartPoint:(CGPoint)start endPoint:(CGPoint)end
{
    return [[self alloc] initWithStartPoint:start endPoint:end];
}


- (instancetype)initWithStartPoint:(CGPoint)start endPoint:(CGPoint)end
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
