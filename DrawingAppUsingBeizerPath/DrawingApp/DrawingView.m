//
//  DrawingView.m
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 28..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "DrawingView.h"
#import "MyColor.h"
#import "MyBezierPath.h"


@implementation DrawingView
{
    NSMutableArray *mPaths;
    NSMutableDictionary *mTempPath;
    MyColor *mPointColor;
}


#pragma mark - init


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self setBackgroundColor:[UIColor whiteColor]];
        mPaths = [NSMutableArray array];
        mTempPath = [NSMutableDictionary dictionary];
        mPointColor = [MyColor colorWithRed:0 green:0 blue:0];
    }
    
    return self;
}


#pragma mark - touches/draw


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];

    for (UITouch *touch in touches)
    {
        MyBezierPath *path = [[MyBezierPath alloc] init];

        CGPoint point = [touch locationInView:self];
        [path moveToPoint:point];
        path.time = [NSDate timeIntervalSinceReferenceDate];
        [path setupColor:mPointColor];
        path.lineWidth = 5.0f;
        path.lineCapStyle = kCGLineCapRound;
        
        
        mTempPath[@((int)touch)] = path;
    }

    
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    for (UITouch *touch in touches)
    {
        NSNumber *key = @((int)touch);
        MyBezierPath *path = mTempPath[key];
        
        if (path){
            CGPoint point = [touch locationInView:self];
            [path addLineToPoint:point];
            
        }
    }
    
    [self setNeedsDisplay];
   
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    for (UITouch *touch in touches)
    {
        NSNumber *key = @((int)touch);
        MyBezierPath *path = mTempPath[key];
        
        if (path){
            CGPoint point = [touch locationInView:self];
            [path addLineToPoint:point];
            path.time = [NSDate timeIntervalSinceReferenceDate] - path.time;
        }
        
        [mTempPath removeObjectForKey:key];
        [mPaths addObject:path];
    }
    
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 0.57, 0.31, 0.25, 1);
    CGContextStrokeRectWithWidth(context, rect, 10);
    
    for (MyBezierPath *path in mPaths)
    {
        [path.color setStroke];
        [path stroke];
    }
    
    for (MyBezierPath *path in [mTempPath allValues])
    {
        [path.color setStroke];
        [path stroke];
    }

}


#pragma mark - public


- (void)clear
{
    [CATransaction begin];
    mPaths = [NSMutableArray array];
    mTempPath = [NSMutableDictionary dictionary];
    
    for (CALayer *layer in self.layer.sublayers){
        [layer removeFromSuperlayer];
    }
    
    [CATransaction commit];
    
    [self setNeedsDisplay];
}


- (void)replay
{
    UIView *preview = [self setupPreview];
    
    NSTimeInterval total = 0.0;
    
    for (MyBezierPath *path in mPaths)
    {
        CAShapeLayer *shapeLayer = [self setupShapeLayerForPath:path];
        CABasicAnimation *pathAnimation = [self setupPathAnimationForPath:path];
       
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, total * NSEC_PER_SEC), dispatch_get_main_queue(), ^
        {
            [shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
            [preview.layer addSublayer:shapeLayer];
        });
        
        total += path.time;
    }
    
}


- (void)changeColor
{
    mPointColor = [MyColor colorWithRed:arc4random_uniform(255)/255.0
                                  green:arc4random_uniform(255)/255.0
                                   blue:arc4random_uniform(255)/255.0];
}


#pragma mark - private

- (UIView *)setupPreview
{
    CGSize screenSize = [self bounds].size;
    
    UIView *preview = [[UIView alloc] initWithFrame:CGRectMake(5, 5, screenSize.width - 10, screenSize.height - 10)];
    preview.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:preview];
    
    return preview;
}


- (CAShapeLayer *)setupShapeLayerForPath:(MyBezierPath *)path
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [path.color CGColor];
    shapeLayer.fillColor = nil;
    shapeLayer.lineWidth = 5.0f;
    shapeLayer.lineJoin = kCALineJoinBevel;
    
    return shapeLayer;
}


- (CABasicAnimation *)setupPathAnimationForPath:(MyBezierPath *)path
{
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = path.time;
    pathAnimation.fromValue = @(0.0f);
    pathAnimation.toValue = @(1.0f);
    
    return pathAnimation;
}


@end
