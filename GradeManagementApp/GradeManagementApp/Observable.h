//
//  Observable.h
//  GradeManagementApp
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#ifndef GradeManagementApp_Observable_h
#define GradeManagementApp_Observable_h

@protocol Observable <NSObject>

- (void)registerAsObserver:(id)observer forObject:(id)Object;

@end

#endif
