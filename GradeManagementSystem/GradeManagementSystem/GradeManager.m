//
//  GradeManager.m
//  GradeManagementSystem
//
//  Created by miyaeyo on 2015. 9. 8..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "GradeManager.h"
#import "Student.h"
#import "Student+GradeSortable.h" 
#import "GradeManager+Observerble.h"


@implementation GradeManager
{
    NSArray *mTableWithStudent; // mGradeTable 딱 봤을 때 이 Array에 어떤게 들어 있는지 파악하기 힘들다. -> mTableWithStudent
}


@synthesize tableWithStudent = mTableWithStudent;


+ (instancetype)gradeManagerWithGradeFile: (NSString *)gradeFile
{
    return [[[GradeManager alloc] initWithGradeFile: gradeFile] autorelease];
}


- (instancetype)initWithGradeFile:(NSString *)gradeFile
{
    self = [super init];
    
    if(self)
    {
        mTableWithStudent = [[self parseGradeFile: gradeFile] retain];
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
        [self registerAsObserver:student forGrade:grade];
            
        [gradeTable addObject:student];
    }

    
    return [NSArray arrayWithArray:gradeTable];

}


- (NSArray *)gradeSortBy:(NSString *)sortingOption
{
    NSArray *tableSortedByGrade = [mTableWithStudent sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2)
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


//- (NSArray *)modifyWhos:(NSString *)name subject:(NSString *)subject grade:(double)grade
//{
//    
//}
//

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
    [mTableWithStudent release];
    
    [super dealloc];
}


@end


/* comment: 1. printGradeTableSortBy -> method명에서 봐도 알 수 있듯이 두가지의 기능을 한번에 수행한다. 분리하는 것이 좋다.
 *          -> gradeSortBy, printGradeTable로 분리
 *          2. performSelector 같은 경우는 바로 실행되지 않는다. 여기서 쓰기엔 무리가 있다. 다른 방법을 찾아 볼 것.
 *          -> GradeSortable protocol을 만들고, student에 GradeSortable category를 추가한 후 protocol의 interface구현
 */

//- (void)printGradeTableSortBy: (NSString *)sortingOption
//{
//    printf("\tName\t|\tKorean\t|\tEnglish\t|\tMath\t|\tTotal\t|\tGPA\n");
//    printf("=======================================================================\n");
//    
//    SEL selector = NSSelectorFromString(sortingOption);
//
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


