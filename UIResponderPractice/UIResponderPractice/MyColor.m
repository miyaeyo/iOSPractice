//
//  MyColor.m
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 23..
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


+ (instancetype)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b
{
    return [[[self alloc] initWithRed:r green:g blue:b] autorelease];
}

- (instancetype)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b
{
    self = [super init];
    
    if (self)
    {
        mRed = r;
        mGreen = g;
        mBlue = b;
    }
    
    return self;
}



@end
