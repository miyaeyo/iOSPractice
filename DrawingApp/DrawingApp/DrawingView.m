//
//  DrawingView.m
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 23..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView
{
    id <DrawingDelegate> __weak mDelegate;
}


@synthesize delegate = mDelegate;



- (void)didChangePoint
{
    
}

@end
