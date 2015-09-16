//
//  GradeSortable.h
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#ifndef GradeManagementApp_refactor_GradeSortable_h
#define GradeManagementApp_refactor_GradeSortable_h

@protocol GradeSortable <NSObject>

@required
- (double)gradeFromSortingOption:(NSString *)sortingOption;

@end


#endif
