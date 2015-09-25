//
//  MyPoint.m
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 23..
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


+ (instancetype)pointWithPoint:(CGPoint)point time:(NSTimeInterval)time color:(MyColor *)color
{
    return [[self alloc] initWithPoint:point time:time color:color];
}


- (instancetype)initWithPoint:(CGPoint)point time:(NSTimeInterval)time color:(MyColor *)color
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
