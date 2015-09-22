//
//  MyView.h
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 21..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DrawingView : UIView

@property (nonatomic, readonly) NSMutableArray *lines;

- (void)clearDrawingView;

- (void)replayDrawingLines:(NSArray *)lines;

@end
