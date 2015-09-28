//
//  MyBezierPath.m
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 28..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "MyBezierPath.h"

@implementation MyBezierPath
{
    NSTimeInterval mTime;
    UIColor *mColor;
}


@synthesize time = mTime;
@synthesize color = mColor;


- (void)setupColor:(MyColor *)color
{
    mColor = [UIColor colorWithRed:color.red green:color.green blue:color.blue alpha:1];
}


@end
