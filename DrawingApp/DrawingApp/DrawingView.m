//
//  DrawingView.m
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 23..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "DrawingView.h"
#import "MyPoint.h"
#import "MyColor.h"
#import "MyLine.h"


@implementation DrawingView
{
    id <DrawingDelegate> __weak mDelegate;
    MyPoint *mPoint;
    MyColor *mPointColor;
    NSArray *mLines;
    
}


@synthesize delegate = mDelegate;


#pragma mark - init


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        mPointColor = [MyColor colorWithRed:0 green:0 blue:0];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    
    return self;
}


#pragma mark - touches/draw


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    mPoint = [self touchedPoint:[touches anyObject]];
    [mDelegate didStartDrawing:mPoint];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    mPoint = [self touchedPoint:[touches anyObject]];
    [mDelegate drawingWithPoint:mPoint];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self setupContext:context inRect:rect];
    [self drawInContext:context];

}


#pragma mark - public


- (void)didChangePoint
{
    [self setNeedsDisplay];
}

- (void)setLine:(NSArray *)lines
{
    mLines = lines;
}

- (void)changeColor
{
    mPointColor = [MyColor colorWithRed:arc4random_uniform(255)/255.0
                                  green:arc4random_uniform(255)/255.0
                                   blue:arc4random_uniform(255)/255.0];

}


#pragma mark - private


- (MyPoint *)touchedPoint:(UITouch *)touch
{
    return [MyPoint pointWithPoint:[touch locationInView:self] time:[touch timestamp] color:mPointColor];
}


- (void)setupContext:(CGContextRef)context inRect:(CGRect)rect
{
    CGContextSetRGBStrokeColor(context, 0.57, 0.31, 0.25, 1);
    CGContextStrokeRectWithWidth(context, rect, 10);
    CGContextSetLineWidth(context, 5);
    CGContextSetLineCap(context, kCGLineCapRound);
}


- (void)drawInContext:(CGContextRef)context
{
    CGContextBeginPath(context);
    for (MyLine *line in mLines) {
        CGContextSetRGBStrokeColor(context, line.start.color.red, line.start.color.green, line.start.color.blue, 1);
        CGContextMoveToPoint(context, line.start.point.x, line.start.point.y);
        CGContextAddLineToPoint(context, line.end.point.x, line.end.point.y);
        //sleep(line.end.time - line.start.time);
        CGContextStrokePath(context);
    }
}


@end
