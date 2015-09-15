//
//  Person.m
//  KVOPractice
//
//  Created by miyaeyo on 2015. 9. 15..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"hunger"]) {
        NSLog(@"%@", [object valueForKey:keyPath]);
    }
}

@end
