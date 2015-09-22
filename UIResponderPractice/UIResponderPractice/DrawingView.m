//
//  MyView.m
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 21..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "DrawingView.h"
#import "Line.h"

@implementation DrawingView
{
    NSMutableArray *mLines;
    CGPoint lastPoint;
}


@synthesize lines = mLines;


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        mLines = [[NSMutableArray alloc] init];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    
    return self;
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches began");
    [super touchesBegan:touches withEvent:event];

    lastPoint = [[touches anyObject] locationInView:self];

}


- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches moved");
    [super touchesMoved:touches withEvent:event];

    CGPoint newPoint = [[touches anyObject] locationInView:self];
    [mLines addObject:[Line lineWithStartPoint:lastPoint endPoint:newPoint]];
    lastPoint = newPoint;
    
    [self setNeedsDisplay];

}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches ended");
    [super touchesEnded:touches withEvent:event];

}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches cancelled");
    [super touchesCancelled:touches withEvent:event];
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 0.57, 0.31, 0.25, 1);
    CGContextStrokeRectWithWidth(context, rect, 10);
    CGContextSetRGBStrokeColor(context, 0.38, 0.51, 0.43, 1);
    CGContextSetLineWidth(context, 5);
    CGContextSetLineCap(context, kCGLineCapRound);

    CGContextBeginPath(context);
    for (Line *line in mLines) {
        CGContextMoveToPoint(context, line.start.x, line.start.y);
        CGContextAddLineToPoint(context, line.end.x, line.end.y);
    }
    CGContextStrokePath(context);

}

- (void)clearDrawingView
{
    [mLines removeAllObjects];
    
    [self setNeedsDisplay];
}

- (void)replayDrawingLines:(NSArray *)lines
{
    mLines = [NSMutableArray arrayWithArray:lines];
    
    [self setNeedsDisplay];
    
}

- (void)dealloc
{
    [mLines release];
    
    [super dealloc];
}
@end
