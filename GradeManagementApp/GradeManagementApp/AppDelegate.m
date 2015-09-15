//
//  AppDelegate.m
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
{
    GradeManager *mGradeManager;
}


@synthesize gradeManager = mGradeManager;


- (void)applicationReceivedEvent:(Event *)event
{
    if ([[event key] isEqualToString:@"filePath"])
    {
        mGradeManager = [GradeManager gradeManagerWithGradeFile:[event value]];
    }
    
    else if ([[event key] isEqualToString:@"sortingOption"])
    {
        [mGradeManager printGradeTable:[mGradeManager gradeSortBy:[event value]]];
    }
}


@end
