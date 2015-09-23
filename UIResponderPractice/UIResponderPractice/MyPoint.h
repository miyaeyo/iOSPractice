//
//  MyPoint.h
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 22..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyColor.h"

@interface MyPoint : NSObject

@property (nonatomic, readonly) CGPoint point;
@property (nonatomic, readonly) double time;
@property (nonatomic, readonly) MyColor *color;

+ (instancetype)pointWithPoint:(CGPoint)point withTime:(double)time withColor:(MyColor *)color;


@end
