//
//  PointStorage.h
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 23..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyPoint.h"

@interface PointStorage : NSObject

- (NSArray *)line;
- (void)makeLine:(MyPoint *)point;

@end
