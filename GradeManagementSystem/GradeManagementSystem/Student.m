//
//  Student.m
//  GradeManagementSystem
//
//  Created by miyaeyo on 2015. 9. 8..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Student.h"

@implementation Student
{
    NSString *mName;
    Grade *mGrade;
}


@synthesize name = mName;
@synthesize grade = mGrade;


+ (instancetype)studentWithName: (NSString *)name grade: (Grade *)grade
{
    return [[[Student alloc] initWithName: name grade: grade] autorelease];
}


- (instancetype)initWithName: (NSString *)name grade: (Grade *)grade
{
    self = [super init];
    
    if(self)
    {
        mName = [name retain];
        mGrade = [grade retain];
    }
    
    return self;
}

- (void)dealloc
{
    
    [mName release];
    [mGrade release];
    
    [super dealloc];
}


@end
