//
//  GradeManager.m
//  GradeManagementSystem
//
//  Created by miyaeyo on 2015. 9. 8..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "GradeManager.h"
#import "Student.h"


@implementation GradeManager
{
    NSArray *mTableWithStudent;
}

@synthesize tableWithStudent = mTableWithStudent;

+ (instancetype)gradeManagerWithGradeFile: (NSString *)gradeFilePath
{
    return [[[GradeManager alloc] initWithGradeFile: gradeFilePath] autorelease];
}

- (instancetype)initWithGradeFile: (NSString *)gradeFilePath
{
    self = [super init];
    
    if(self)
    {
        mTableWithStudent = [[self parseGradeFile: gradeFilePath] retain];
    }
    
    return self;
}

- (NSArray *)parseGradeFile: (NSString *)gradeFilePath
{
   
    NSString *fileContentsToString = [NSString stringWithContentsOfFile:gradeFilePath
                                                               encoding:NSUTF8StringEncoding
                                                                  error:nil];
    
    NSArray *studentsGradeByRow = [fileContentsToString componentsSeparatedByString:@"\r"];
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

- (NSArray *)GradeSortBy:(NSString *)sortingOption
{
    
}






//- (void)printGradeTableSortBy: (NSString *)sortingOption
//{
//    printf("\tName\t|\tKorean\t|\tEnglish\t|\tMath\t|\tTotal\t|\tGPA\n");
//    printf("=======================================================================\n");
//    
//    SEL selector = NSSelectorFromString(sortingOption);
//    // performSelector:는 바로 실행되지 않는다. 그래서 여기서는 작동을 제대로 안한다. 
//    NSArray *sortedGradeTable = [mGradeTable sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//        if ([[obj1 grade] performSelector: selector] > [[obj2 grade] performSelector: selector])
//            return (NSComparisonResult)NSOrderedDescending;
//        else if ([[obj1 grade] performSelector: selector] < [[obj2 grade] performSelector: selector])
//            return (NSComparisonResult)NSOrderedAscending;
//        else
//            return (NSComparisonResult)NSOrderedSame;
//    }];
//    
//    for(Student *student in sortedGradeTable)
//    {
//        NSString *name = [student name];
//        Grade *grade = [student grade];
//        printf("\t%s\t\t%.2lf\t\t%.2lf\t\t%.2lf\t\t%.2lf\t\t%.2lf\n",
//               (char*)[name UTF8String], [grade korean], [grade english], [grade math], [grade total], [grade GPA]);
//    }
//}


- (void)dealloc
{
    [mTableWithStudent release];
    
    [super dealloc];
}


@end
