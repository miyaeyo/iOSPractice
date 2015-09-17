//
//  Student.h
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Grade.h"

@interface Student : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) Grade *grade;


+ (instancetype)studentWithName:(NSString *)name grade:(Grade *)grade;


@end
