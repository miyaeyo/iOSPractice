//
//  AppInfomation.h
//  TableViewPractice
//
//  Created by miyaeyo on 2015. 9. 18..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppInfomation : NSObject

@property (nonatomic, readonly) int rank;
@property (nonatomic, readonly) UIImage *thumbnail;
@property (nonatomic, readonly) NSString *appName;
@property (nonatomic, readonly) NSString *appCreator;

+ (instancetype)appInfomationWithIndex:(int)rank
                             thumbNail:(UIImage *)thumbnail
                                  name:(NSString *)appName
                               creator:(NSString *)appCreator;

@end
