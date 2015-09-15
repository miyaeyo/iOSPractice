//
//  Dog.m
//  KVOPractice
//
//  Created by miyaeyo on 2015. 9. 15..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Dog.h"

@implementation Dog
{
    int mHunger;
}

@synthesize hunger = mHunger;

- (instancetype)init
{
    self = [super init];
    
    if(self)
    {
        mHunger = 1;
    }
    
    return self;
}

- (void)changeHunger:(int) value
{
    mHunger = value;
}

@end
