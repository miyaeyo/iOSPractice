//
//  GradeSortable.h
//  GradeManagementSystem
//
//  Created by miyaeyo on 2015. 9. 9..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#ifndef GradeManagementSystem_GradeSortable_h
#define GradeManagementSystem_GradeSortable_h

@protocol GradeSortable <NSObject>

@required
- (double)gradeFromSortingOption:(NSString *)sortingOption;

@end

#endif
