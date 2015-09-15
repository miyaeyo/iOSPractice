//
//  AppDelegate.h
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyApplicationDelegate.h"
#import "GradeManager.h"

@interface AppDelegate : NSObject <MyApplicationDelegate>

@property (nonatomic, readonly) GradeManager *gradeManager;

@end
