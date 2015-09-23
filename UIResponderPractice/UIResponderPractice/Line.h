//
//  Line.h
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 21..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPoint.h"


@interface Line : NSObject


@property (nonatomic, readonly) MyPoint *start;
@property (nonatomic, readonly) MyPoint *end;


+ (instancetype)lineWithStartPoint:(MyPoint *)start endPoint:(MyPoint *)end;


@end
