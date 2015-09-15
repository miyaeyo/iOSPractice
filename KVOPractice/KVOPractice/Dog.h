//
//  Dog.h
//  KVOPractice
//
//  Created by miyaeyo on 2015. 9. 15..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject

@property (nonatomic) int hunger;

- (void)changeHunger:(int) value;

@end
