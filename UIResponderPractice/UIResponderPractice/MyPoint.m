//
//  MyPoint.m
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 22..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "MyPoint.h"

@implementation MyPoint
{
    CGPoint mPoint;
    NSTimeInterval mTime;
    MyColor *mColor;
}


@synthesize point = mPoint;
@synthesize time = mTime;
@synthesize color = mColor;


+ (instancetype)pointWithPoint:(CGPoint)point withTime:(double)time withColor:(MyColor *)color
{
    return [[[self alloc] initWithPoint:point withTime:time withColor:color] autorelease];
}


- (instancetype)initWithPoint:(CGPoint)point withTime:(double)time withColor:(MyColor *)color
{
    self = [super init];
    
    if (self)
    {
        mPoint = point;
        mTime = time;
        mColor = color;
    }
    
    return self;
}

@end
