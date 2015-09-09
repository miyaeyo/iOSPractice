//
//  Grade.h
//  GradeManagementSystem
//
//  Created by miyaeyo on 2015. 9. 8..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Grade : NSObject


@property (nonatomic, readonly)double korean;
@property (nonatomic, readonly)double english;
@property (nonatomic, readonly)double math;
@property (nonatomic, readonly)double total;
@property (nonatomic, readonly)double GPA;


+ (instancetype)gradeWithGrade: (NSArray *)grade;

@end
