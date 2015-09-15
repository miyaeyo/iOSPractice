//
//  main.m
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyApplication.h"
#import "AppDelegate.h"

//filePath: /Users/miyaeyo/Dropbox/NHN_NEXT_2학기/IOS/IOS_practice/GradeManagementSystem/grade.txt

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyApplication *myApp = [MyApplication MyApplicationMainWithAppDelegate:[AppDelegate class]];
        
        
        printf("****** Grade Management System ******\n");
        
        int loopCount = 0;
        
        while (1)
        {
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
                    
                    Event *event;
                    
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
                            event = [Event eventWithKey:@"filePath" value:fileContentsToString];
                            [[myApp eventQueue] setEvent:event];

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
                    event = [Event eventWithKey:@"sortingOption" value:sortingOption];
                    [[myApp eventQueue] setEvent:event];
                    
                    
                }
            }
            
            else printf("\n!!!Wrong input.\nPlease check your input.\n");
        }
        
    }
    return 0;
}
