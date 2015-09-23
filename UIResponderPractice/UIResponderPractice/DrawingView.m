//
//  MyView.m
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 21..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "DrawingView.h"
#import "Line.h"
#import "MyPoint.h"
#import "MyColor.h"


@implementation DrawingView
{
    NSMutableArray *mLines;
    MyPoint *lastPoint;
    MyColor *pointColor;
}


#pragma mark - init/dealloc


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        mLines = [[NSMutableArray alloc] init];
        pointColor = [[MyColor colorWithRed:0.38
                                      green:0.51
                                       blue:0.43] retain];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    
    return self;
}


- (void)dealloc
{
    [mLines release];
    [lastPoint release];
    [pointColor release];
    
    [super dealloc];
}


#pragma mark - touches/draw


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    lastPoint = [[self touchedPoint:touch] retain];
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    MyPoint *newPoint = [self touchedPoint:touch];
    
    [mLines addObject:[Line lineWithStartPoint:lastPoint endPoint:newPoint]];
    lastPoint = [newPoint retain];
    
    [self didChangeLines];
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

- (NSArray *)lines
{
    return [NSArray arrayWithArray:mLines];
}


- (void)clear
{
    [mLines removeAllObjects];
    [self didChangeLines];
}


- (void)replayWithLines:(NSArray *)lines
{
    [mLines addObjectsFromArray:lines];
    [self didChangeLines];
}


- (void)changeColor
{
    //[pointColor release];
    pointColor = [[MyColor colorWithRed:arc4random_uniform(255)/255.0
                                  green:arc4random_uniform(255)/255.0
                                   blue:arc4random_uniform(255)/255.0] retain];
}


#pragma mark - private

- (void)didChangeLines
{
    [self setNeedsDisplay];
}


- (MyPoint *)touchedPoint:(UITouch *)touch
{
    return [MyPoint pointWithPoint:[touch locationInView:self] withTime:[touch timestamp] withColor:pointColor];
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
    for (Line *line in mLines) {
        CGContextSetRGBStrokeColor(context, line.start.color.red, line.start.color.green, line.start.color.blue, 1);
        CGContextMoveToPoint(context, line.start.point.x, line.start.point.y);
        CGContextAddLineToPoint(context, line.end.point.x, line.end.point.y);
        //sleep(line.end.time - line.start.time);
        CGContextStrokePath(context);
    }
}


@end
