//
//  Student+GradeSortable.m
//  GradeManagementSystem
//
//  Created by miyaeyo on 2015. 9. 9..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Student+GradeSortable.h"

@implementation Student (GradeSortable)

- (double)gradeFromSortingOption:(NSString *)sortingOption
{
    return [[[self grade] valueForKey:sortingOption] doubleValue];
}

@end
