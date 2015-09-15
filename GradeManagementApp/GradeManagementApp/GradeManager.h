//
//  GradeManager.h
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 13..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GradeManager : NSObject


@property (nonatomic, readonly) NSArray *tableOfStudent;


+ (instancetype)gradeManagerWithGradeFile:(NSString *)gradeFile;
- (NSArray *)gradeSortBy:(NSString *)sortingOption;
- (void)printGradeTable:(NSArray *)gradeTable;


@end
