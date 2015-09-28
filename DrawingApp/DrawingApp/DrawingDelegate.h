//
//  EventDelegate.h
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 23..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#ifndef DrawingApp_EventDelegate_h
#define DrawingApp_EventDelegate_h

#import "MyPoint.h"
#import "MyColor.h"

@protocol DrawingDelegate <NSObject>


@required

- (void)didStartDrawing:(MyPoint *)point;
- (void)drawingWithPoint:(MyPoint *)point;


@end


#endif
