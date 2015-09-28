//
//  MyBezierPath.h
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 28..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyColor.h"


@interface MyBezierPath : UIBezierPath

@property (nonatomic, assign) NSTimeInterval time;
@property (nonatomic) UIColor *color;

- (void)setupColor:(MyColor *)color;

@end
