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
    @autoreleasepool {
        //성적 txt파일 path를 입력하면
        //sorting하여
        //출력함
        //filePath: /Users/miyaeyo/Dropbox/NHN_NEXT_2학기/IOS/GradeManagementSystem/grade.txt
        
        char filePathInput[100];
        printf("Input grade file path: ");
        scanf("%s", filePathInput);
        NSString *filePath = [NSString stringWithUTF8String: filePathInput];
        
        GradeManager *gradeManager = [GradeManager gradeManagerWithGradeFile: filePath];
        
        char sortingOptionInput[10];
        printf("Input sorting option (Korean, English, Math, GPA): ");
        scanf("%s", sortingOptionInput);
        NSString *sortingOption = [NSString stringWithUTF8String:sortingOptionInput];
        [gradeManager printGradeTableSortBy:sortingOption];
        
    }
    return 0;
}
