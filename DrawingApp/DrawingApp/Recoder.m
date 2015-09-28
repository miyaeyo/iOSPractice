//
//  EventStorage.m
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 23..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Recoder.h"
#import "PointStorage.h"
#import "MyLine.h"

@implementation Recoder
{
    PointStorage *mStorage;
    id <DrawingDelegate> __weak mDelegate;
    
}


@synthesize delegate = mDelegate;


#pragma mark - init

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        mStorage = [[PointStorage alloc] init];
        
    }
    
    return self;
}



#pragma mark - public

- (void)clear
{
    [mStorage clearLines];
}


- (void)storePoint:(MyPoint *)point isEdge:(BOOL)edge
{
    if (edge)
    {
        [mStorage storeEdgePoint:point];
    }
    else
    {
        [mStorage storeInLinePoint:point];
    }
    
    
}

- (NSArray *)takeOutLines
{
    return [mStorage lines];
}



@end
