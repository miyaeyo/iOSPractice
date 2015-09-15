//
//  MyApplication+Main.m
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "MyApplication+Main.h"

@implementation MyApplication (Main)

- (int)MyApplicationMainWithDelegate:(id)appDelegate
{
    @autoreleasepool {
        mRunLoop = [[RunLoop alloc] init];
        mEventQueue = [[EventQueue alloc] init];
        [self registerAsObserver:mRunLoop forObject:mEventQueue];
        
        
        
        
        
    }
    return 0;
}


@end
