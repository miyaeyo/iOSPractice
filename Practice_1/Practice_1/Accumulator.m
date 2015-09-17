//
//  Accumulator.m
//  Practice_1
//
//  Created by miyaeyo on 2015. 9. 17..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Accumulator.h"

@implementation Accumulator
{
    int mCount;
}

@synthesize count = mCount;

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mCount = 0;
    }
    
    return self;
}

- (void)increaseCount
{
    mCount++;
}

- (void)decreaseCount
{
    if (mCount > 0) mCount--;
}

@end
