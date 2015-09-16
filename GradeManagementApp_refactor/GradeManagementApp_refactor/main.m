//
//  main.m
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Application.h"
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        [[Application sharedApplication] applicationMainWithAppDelegate:[AppDelegate class]];
    }
    return 0;
}
