//
//  Event.h
//  GradeManagementApp_refactor
//
//  Created by miyaeyo on 2015. 9. 16..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic, readonly) NSString *key;
@property (nonatomic, readonly) id value;

+ (instancetype)eventWithKey:(NSString *)key value:(id)value;

@end
