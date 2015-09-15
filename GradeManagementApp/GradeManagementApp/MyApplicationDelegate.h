//
//  MyApplicationDelegate.h
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#ifndef GradeManagementApp_MyApplicationDelegate_h
#define GradeManagementApp_MyApplicationDelegate_h

#import "MyApplication.h"


@protocol MyApplicationDelegate <NSObject>


@required
- (void)applicationReceivedEvent:(Event *)event;


@end


#endif
