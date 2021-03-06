//
//  main.m
//  GradeManagementSystem
//
//  Created by miyaeyo on 2015. 9. 8..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GradeManager.h"
#import "Student.h"


int main(int argc, const char * argv[]) {
    //성적 txt파일 path를 입력하면
    //과목별 혹은 평점으로 sorting(ascending)하여
    //출력함
    //filePath: /Users/miyaeyo/Dropbox/NHN_NEXT_2학기/IOS/IOS_practice/GradeManagementSystem/grade.txt
    @autoreleasepool {
        printf("****** Grade Management System ******\n");
        int loopCount = 0;
        while (1) {
            char startInput;
            if(loopCount == 0) printf("\nDo you want to start Grade Management System (Y / N)? ");
            else printf("\nDo you have other grade file (Y / N)?");
            scanf("%c", &startInput);
            rewind(stdin);
            
            if (startInput == 'N' || startInput == 'n')
            {
                printf("\nFinish this program.\nBYE BYE!\n");
                break;
            }
            else if (startInput == 'Y' || startInput == 'y')
            {
                @autoreleasepool {
                    
                    GradeManager *gradeManager;
                    
                    char filePathInput[100];
                    
                    do{
                        printf("\nInput grade file path: ");
                        scanf("%s", filePathInput);
                        rewind(stdin);
                        
                        NSString *filePath = [NSString stringWithUTF8String: filePathInput];
                        
                        NSString *fileContentsToString = [NSString stringWithContentsOfFile:filePath
                                                                                   encoding:NSUTF8StringEncoding
                                                                                      error:nil];
                        if (fileContentsToString)
                        {
                            gradeManager = [GradeManager gradeManagerWithGradeFile: fileContentsToString];
                            break;
                        }
                        else printf("\n!!!invalid file or empty file.\nPlease check the file path.\n");
                        
                        
                    } while (1);
                    
                    char sortingOptionInput[10];
                    
                    do{
                        printf("\nInput sorting option (korean, english, math, GPA): ");
                        scanf("%s", sortingOptionInput);
                        rewind(stdin);
                        
                        if (strcmp(sortingOptionInput, "korean") || strcmp(sortingOptionInput, "english")
                           || strcmp(sortingOptionInput, "math") || strcmp(sortingOptionInput, "GPA")) break;
                        else printf("\n!!!Wrong input.\nPlease check the sorting option (korean, english, math, GPA).\n");
                        
                    }while (1);
                    
                    NSString *sortingOption = [NSString stringWithUTF8String:sortingOptionInput];
                    [gradeManager printGradeTable:[gradeManager gradeSortBy:sortingOption]];
                    
//                    
//                    // KVO를 사용해 보려고...
//                    char modifyInput;
//                    
//                    do{
//                        printf("Do you want to modify some score (Y / N)? ");
//                        scanf("%c", &modifyInput);
//                        if (modifyInput == 'N' || modifyInput == 'n') break;
//                        else if (modifyInput == 'Y' || modifyInput == 'y')
//                        {
//                            char tName[10];
//                            char tSubject[10];
//                            double grade;
//                            
//                            printf("Input student name and subject of score modified (name subject grade): ");
//                            scanf("%s %s %lf", tName, tSubject, &grade);
//                            NSString *name = [NSString stringWithUTF8String:tName];
//                            NSString *subject = [NSString stringWithUTF8String:tSubject];
//                            
//                            [gradeManager printGradeTable:[gradeManager modifyWhos:name subject:subject grade:grade]];
//                            
//                            
//                        }
//                        else printf("\n!!!Wrong input.\nPlease check your input.\n");
//        
//                        
//
//                    } while(1);
                    
                }
            }
            else printf("\n!!!Wrong input.\nPlease check your input.\n");
        }
    }
    return 0;
}
