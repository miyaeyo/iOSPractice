//
//  DrawingView.h
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 23..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingDelegate.h"

@interface DrawingView : UIView

@property (nonatomic, weak) id <DrawingDelegate> delegate;


- (void)didChangePoint;
- (void)setLine:(NSArray *)lines;
- (void)changeColor;


@end
