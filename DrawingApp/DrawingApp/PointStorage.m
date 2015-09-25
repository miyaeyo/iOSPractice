//
//  PointStorage.m
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 23..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "PointStorage.h"
#import "MyLine.h"
#import "MyPoint.h"


@implementation PointStorage
{
    NSMutableArray *mLines;
    MyPoint *mLastPoint;
}


#pragma mark - init


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mLines = [[NSMutableArray alloc] init];
    }
    
    return self;
}


#pragma mark - public


- (NSArray *)lines
{
    return [NSArray arrayWithArray:mLines];
}


- (void)storeEdgePoint:(MyPoint *)point
{
    mLastPoint = point;
}


- (void)storeInLinePoint:(MyPoint *)point
{
    [mLines addObject:[MyLine lineWithStartPoint:mLastPoint endPoint:point]];
    mLastPoint = point;
}

- (void)clearLines
{
    [mLines removeAllObjects];
}


#pragma mark - private





@end
