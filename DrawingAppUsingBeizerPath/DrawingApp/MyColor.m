
//
//  MyColor.m
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 28..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "MyColor.h"

@implementation MyColor
{
    CGFloat mRed;
    CGFloat mGreen;
    CGFloat mBlue;
}


@synthesize red = mRed;
@synthesize green = mGreen;
@synthesize blue = mBlue;


+ (instancetype)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [[self alloc] initWithRed:red green:green blue:blue];
}


- (instancetype)initWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    self = [super init];
    
    if (self)
    {
        mRed = red;
        mGreen = green;
        mBlue = blue;
    }
    
    return self;
}

@end
