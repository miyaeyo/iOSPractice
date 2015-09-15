//
//  Message.h
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 11..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"


@interface Message : NSObject

@property (nonatomic, readonly)Event *event;

+ (instancetype)messageWithEvent:(Event *)event;

@end
