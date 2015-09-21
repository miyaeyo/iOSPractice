//
//  MyView.m
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 21..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "MyView.h"
#import "Line.h"

@implementation MyView
{
    NSMutableArray *lines;
    CGPoint lastPoint;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        lines = [[NSMutableArray alloc] init];
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
    [lines addObject:[Line lineWithStartPoint:lastPoint endPoint:newPoint]];
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
    
    CGContextSetRGBStrokeColor(context, 0.98, 0.67, 0.39, 1);
    CGContextStrokeRectWithWidth(context, rect, 10);
    CGContextSetLineWidth(context, 5);

    CGContextBeginPath(context);
    for (Line *line in lines) {
        CGContextMoveToPoint(context, line.start.x, line.start.y);
        CGContextAddLineToPoint(context, line.end.x, line.end.y);
    }
    CGContextStrokePath(context);

}

- (void)dealloc
{
    [lines release];
    
    [super dealloc];
}
@end
