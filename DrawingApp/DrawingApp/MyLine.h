//
//  MyLine.h
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 24..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyPoint.h"

@interface MyLine : NSObject


@property (nonatomic, readonly) MyPoint *start;
@property (nonatomic, readonly) MyPoint *end;


+ (instancetype)lineWithStartPoint:(MyPoint *)start endPoint:(MyPoint *)end;


@end
