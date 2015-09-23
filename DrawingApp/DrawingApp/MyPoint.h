//
//  MyPoint.h
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 23..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyColor.h"

@interface MyPoint : NSObject


@property (nonatomic, readonly) CGPoint point;
@property (nonatomic, readonly) NSTimeInterval time;
@property (nonatomic, readonly) MyColor *color;


+ (instancetype)pointWithPoint:(CGPoint)point time:(NSTimeInterval)time color:(MyColor *)color;


@end
