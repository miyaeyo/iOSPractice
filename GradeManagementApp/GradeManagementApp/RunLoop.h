//
//  RunLoop.h
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventQueue.h"
#import "MyApplicationDelegate.h"

@interface RunLoop : NSObject


+ (instancetype)runLoopWithAppDelegate:(id)appDelegate;


@end
