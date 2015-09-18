//
//  AppInfomation.m
//  TableViewPractice
//
//  Created by miyaeyo on 2015. 9. 18..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "AppInfomation.h"

@implementation AppInfomation
{
    int mRank;
    UIImage *mThumbNail;
    NSString *mAppName;
    NSString *mAppCreator;
}


@synthesize rank = mRank;
@synthesize thumbnail = mThumbNail;
@synthesize appName = mAppName;
@synthesize appCreator = mAppCreator;


+ (instancetype)appInfomationWithIndex:(int)rank
                             thumbNail:(UIImage *)thumbnail
                                  name:(NSString *)appName
                               creator:(NSString *)appCreator
{
    return [[self alloc] initWithIndex:rank thumbNail:thumbnail name:appName creator:appCreator];
}


- (instancetype)initWithIndex:(int)rank
                    thumbNail:(UIImage *)thumbnail
                         name:(NSString *)appName
                      creator:(NSString *)appCreator
{
    self = [super init];
    
    if (self)
    {
        mRank = rank;
        mThumbNail = [thumbnail retain];
        mAppName = [appName retain];
        mAppCreator = [appCreator retain];
    }
    
    return self;
    
}


- (void)dealloc
{
    [mThumbNail release];
    [mAppName release];
    [mAppCreator release];
    
    [super dealloc];
}

@end
