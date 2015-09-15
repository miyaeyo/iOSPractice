//
//  Grade.h
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 13..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Grade : NSObject


@property (nonatomic)double korean;
@property (nonatomic)double english;
@property (nonatomic)double math;
@property (nonatomic, readonly)double total;
@property (nonatomic, readonly)double GPA;


+ (instancetype)gradeWithGrade: (NSArray *)grade;

@end
