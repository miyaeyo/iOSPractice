//
//  GradeManager+Observerble.m
//  GradeManagementSystem
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "GradeManager+Observerble.h"

@implementation GradeManager (Observerble)

- (void)registerAsObserver:(id)student forGrade:(id)grade
{
    [grade addObserver:student
            forKeyPath:@"korean"
               options:NSKeyValueObservingOptionNew
               context:NULL];
    
    [grade addObserver:student
            forKeyPath:@"english"
               options:NSKeyValueObservingOptionNew
               context:NULL];
    
    [grade addObserver:student
            forKeyPath:@"math"
               options:NSKeyValueObservingOptionNew
               context:NULL];
}

@end
