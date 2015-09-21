//
//  Line.h
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 21..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Line : NSObject

@property (nonatomic, readonly) CGPoint start;
@property (nonatomic, readonly) CGPoint end;

+ (instancetype)lineWithStartPoint:(CGPoint)start endPoint:(CGPoint)end;


@end
