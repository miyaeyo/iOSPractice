//
//  MyColor.h
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 23..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyColor : NSObject


@property (nonatomic, readonly) CGFloat red;
@property (nonatomic, readonly) CGFloat green;
@property (nonatomic, readonly) CGFloat blue;


+ (instancetype)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;


@end
