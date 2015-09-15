//
//  GradeManager+Observerble.h
//  GradeManagementSystem
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "GradeManager.h"

@interface GradeManager (Observerble)

- (void)registerAsObserver:(id)observer forGrade:(id)object;

@end
