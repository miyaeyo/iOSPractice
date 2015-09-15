//
//  GradeSortable.h
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 13..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#ifndef GradeManagementApp_GradeSortable_h
#define GradeManagementApp_GradeSortable_h


@protocol GradeSortable <NSObject>

@required
- (double)gradeFromSortingOption:(NSString *)sortingOption;

@end


#endif
