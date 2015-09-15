//
//  Student+observer.m
//  GradeManagementSystem
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Student+observer.h"

@implementation Student (observer)

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if([keyPath isEqual:@"korean"])
        [[self grade] setKorean:[[change objectForKey:NSKeyValueChangeNewKey] doubleValue]];
    else if([keyPath isEqual:@"english"])
        [[self grade] setEnglish:[[change objectForKey:NSKeyValueChangeNewKey] doubleValue]];
    else if([keyPath isEqual:@"math"])
        [[self grade] setMath:[[change objectForKey:NSKeyValueChangeNewKey] doubleValue]];
}

@end
