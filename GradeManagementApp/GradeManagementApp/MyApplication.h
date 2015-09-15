//
//  MyApplication.h
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventQueue.h"
#import "RunLoop.h"

@interface MyApplication : NSObject

@property (nonatomic, readonly) EventQueue *eventQueue;

+ (instancetype)MyApplicationMainWithAppDelegate:(id)appDelegate;

@end
