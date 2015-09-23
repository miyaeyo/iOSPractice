//
//  MyView.h
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 21..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrawingView : UIView

- (NSArray *)lines;
- (void)clear;
- (void)replayWithLines:(NSArray *)lines;
- (void)changeColor;


@end
