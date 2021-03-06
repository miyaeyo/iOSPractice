//
//  GradeManager.h
//  GradeManagementSystem
//
//  Created by miyaeyo on 2015. 9. 8..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GradeManager : NSObject

@property (nonatomic, readonly) NSArray *tableWithStudent;

+ (instancetype)gradeManagerWithGradeFile:(NSString *)gradeFile;
- (NSArray *)gradeSortBy:(NSString *)sortingOption;
//- (NSArray *)modifyWhos:(NSString *)name subject:(NSString *)subject grade:(double)grade;
- (void)printGradeTable:(NSArray *)gradeTable;

@end
