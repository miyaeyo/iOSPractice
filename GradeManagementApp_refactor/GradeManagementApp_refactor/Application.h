//
//  Application.h
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RunLoop.h"
#import "ApplicationDelegate.h"



@interface Application : NSObject

@property (nonatomic, readonly) id <ApplicationDelegate> appDelegate;



+ (instancetype)sharedApplication;
- (void)applicationMainWithAppDelegate:(Class)appDelegate;
- (void)delegateEvent:(Event *)event;

@end
