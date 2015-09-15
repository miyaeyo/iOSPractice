//
//  GradeManager.m
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 13..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "GradeManager.h"
#import "Student.h"
#import "Student+GradeSortable.h"


@implementation GradeManager

{
    NSArray *mTableOfStudent;
}


@synthesize tableOfStudent = mTableOfStudent;


+ (instancetype)gradeManagerWithGradeFile: (NSString *)gradeFile
{
    return [[[GradeManager alloc] initWithGradeFile: gradeFile] autorelease];
}


- (instancetype)initWithGradeFile:(NSString *)gradeFile
{
    self = [super init];
    
    if(self)
    {
        mTableOfStudent = [[self parseGradeFile: gradeFile] retain];
    }
    
    return self;
}


- (NSArray *)parseGradeFile:(NSString *)gradeFile
{
    NSArray *studentsGradeByRow = [gradeFile componentsSeparatedByString:@"\r"];
    NSMutableArray *gradeTable = [[[NSMutableArray alloc] init] autorelease];
    
    NSString *studentInfo;
    for(studentInfo in studentsGradeByRow)
    {
        NSArray *parsedStudentInfo = [studentInfo componentsSeparatedByString:@"\t\t"];
        
        if([[parsedStudentInfo firstObject] isEqualToString:@"Name"]) continue;
        
        NSArray *parsedGrade = [NSArray arrayWithObjects:
                                [parsedStudentInfo objectAtIndex:1],
                                [parsedStudentInfo objectAtIndex:2],
                                [parsedStudentInfo objectAtIndex:3], nil];
        
        Grade *grade = [Grade gradeWithGrade: parsedGrade];
        Student *student = [Student studentWithName:[parsedStudentInfo firstObject] grade: grade];        
        [gradeTable addObject:student];
    }
    
    
    return [NSArray arrayWithArray:gradeTable];
    
}


- (NSArray *)gradeSortBy:(NSString *)sortingOption
{
    NSArray *tableSortedByGrade = [mTableOfStudent sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2)
                                   {
                                       double score1 = [obj1 gradeFromSortingOption:sortingOption];
                                       double score2 = [obj2 gradeFromSortingOption:sortingOption];
                                       if(score1 > score2)
                                           return (NSComparisonResult)NSOrderedDescending;
                                       else if(score1 < score2)
                                           return (NSComparisonResult)NSOrderedAscending;
                                       else
                                           return (NSComparisonResult)NSOrderedSame;
                                       
                                   }];
    
    return tableSortedByGrade;
    
}


- (void)printGradeTable:(NSArray *)gradeTable
{
    printf("\tName\t|\tKorean\t|\tEnglish\t|\tMath\t|\tTotal\t|\tGPA\n");
    printf("=======================================================================\n");
    
    for(Student *student in gradeTable)
    {
        NSString *name = [student name];
        Grade   *grade = [student grade];
        printf("%7s\t\t\t%.2lf\t\t%.2lf\t\t%.2lf\t\t%.2lf\t\t%.2lf\n",
               (char*)[name UTF8String], [grade korean], [grade english], [grade math], [grade total], [grade GPA]);
    }
}


- (void)dealloc
{
    [mTableOfStudent release];
    
    [super dealloc];
}


@end
