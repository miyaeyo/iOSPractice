//
//  Accumulator.h
//  Practice_1
//
//  Created by miyaeyo on 2015. 9. 17..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Accumulator : NSObject

@property (nonatomic, readonly) int count;

- (void)increaseCount;
- (void)decreaseCount;


@end
