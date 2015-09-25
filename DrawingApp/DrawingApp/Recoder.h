//
//  EventStorage.h
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 23..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrawingDelegate.h"
#import "MyPoint.h"

@interface Recoder : NSObject

@property (nonatomic, weak) id <DrawingDelegate> delegate;

- (void)draw;
- (void)replay;
- (void)changeColor;
- (void)storePoint:(MyPoint *)point isEdge:(BOOL)edge;
- (NSArray *)takeOutLines;

@end
