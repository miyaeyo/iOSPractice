//
//  GradeManager.h
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Student+GradeSortable.h"


@interface GradeManager : NSObject


@property (nonatomic, readonly) NSArray *tableOfStudent;


+ (instancetype)gradeManagerWithGradeFile:(NSString *)gradeFile;
- (NSArray *)gradeSortBy:(NSString *)sortingOption;
- (void)printGradeTable:(NSArray *)gradeTable;


@end
