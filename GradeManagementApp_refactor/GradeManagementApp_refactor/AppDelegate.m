//
//  AppDelegate.m
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "AppDelegate.h"
#import "GradeManager.h"

@implementation AppDelegate
{
    
    NSString *filePath;
    NSString *fileContents;
    GradeManager *gradeManager;
    NSArray *tableOfStudent;
}


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        
        filePath = @"/Users/miyaeyo/Dropbox/NHN_NEXT_2학기/IOS/IOS_practice/GradeManagementSystem/grade.txt";
        
        fileContents = [NSString stringWithContentsOfFile:filePath
                                                           encoding:NSUTF8StringEncoding
                                                              error:nil];
        gradeManager = [GradeManager gradeManagerWithGradeFile:fileContents];
        tableOfStudent = [[gradeManager tableOfStudent] retain];
    }
    
    return self;
}


- (void)applicationDidBecomeActive
{
    printf("****** Grade Management System ******\n");
    printf("[Input mode]\n");
    printf("print: Print grade table\n");
    printf("sort: Sorting grade table by sorting option\n");
    printf("end: End program\n");
   
}


- (void)applicationReceivedEvent:(Event *)event
{
    if([[event key] isEqualToString:@"print"])
    {
        [gradeManager printGradeTable:tableOfStudent];
    }
    else if([[event key] isEqualToString:@"sort"])
    {
        char sortingOption[10];
        printf("[sorting mode: ascending order to [korean, english, math, GPA] score]\n");
        printf("input sorting option (korean, english, math, GPA): ");
        scanf("%s", sortingOption);
        rewind(stdin);
        
        [tableOfStudent release];
        tableOfStudent = [[gradeManager gradeSortBy:[NSString stringWithUTF8String:sortingOption]] retain];
    }
}


- (void)applicationWillTerminate
{
    printf("\nFinish this application.\nBYE BYE!\n");
}


- (void)dealloc
{
    [filePath release];
    [tableOfStudent release];
    
    [super dealloc];
}


@end
