//
//  Grade.m
//  GradeManagementSystem
//
//  Created by miyaeyo on 2015. 9. 8..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "Grade.h"

@implementation Grade
{
    double mKorean;
    double mEnglish;
    double mMath;
    double mTotal;
    double mGPA;
}

@synthesize korean = mKorean;
@synthesize english = mEnglish;
@synthesize math = mMath;
@synthesize total = mTotal;
@synthesize GPA = mGPA;

+ (instancetype)gradeWithGrade: (NSArray *)grade
{
    return [[[Grade alloc] initWithGrade: grade] autorelease];
}

- (instancetype)initWithGrade: (NSArray *)grade
{
    self = [super init];
    
    if(self)
    {
        mKorean = [[grade objectAtIndex:0] doubleValue];
        mEnglish = [[grade objectAtIndex:1] doubleValue];
        mMath = [[grade objectAtIndex:2] doubleValue];
        mTotal = mKorean + mEnglish + mMath;
        mGPA = mTotal / 3;
        
    }
    
    return self;
}


@end
