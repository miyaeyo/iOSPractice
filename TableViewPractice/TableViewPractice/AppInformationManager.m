//
//  TopPaidApplications.m
//  TableViewPractice
//
//  Created by miyaeyo on 2015. 9. 18..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "AppInformationManager.h"

@implementation AppInformationManager

- (NSArray *)parsingData
{
    NSURL *dataUrl =[NSURL URLWithString: @"https://itunes.apple.com/kr/rss/toppaidapplications/limit=100/json"];
    NSData *dataFromUrl = [NSData dataWithContentsOfURL:dataUrl];
    NSDictionary *parsedData = [NSJSONSerialization JSONObjectWithData:dataFromUrl
                                                               options:NSJSONReadingAllowFragments
                                                                 error:Nil];
    
    NSArray *appInfos = [[parsedData valueForKey:@"feed"] valueForKey:@"entry"];
    //NSLog(@"%@", appInfos);
    
    NSMutableArray *tempAppInfos = [[NSMutableArray alloc] init];
    
    int rank = 1;
    
    for (NSDictionary *appInfo in appInfos) {
        
        //height: 53
        NSString *thumbnailUrl = [[[appInfo valueForKey:@"im:image"] objectAtIndex:0] valueForKey:@"label"];
        UIImage *thumbnail = [self imageFromURL:[NSURL URLWithString:thumbnailUrl]];
        NSString *appName = [[appInfo valueForKey:@"im:name"] valueForKey:@"label"];
        NSString *appCreator = [[appInfo valueForKey:@"im:artist"] valueForKey:@"label"];
    
        
        AppInfomation *app = [AppInfomation appInfomationWithIndex:rank
                                                         thumbNail:thumbnail
                                                              name:appName
                                                           creator:appCreator];
        [tempAppInfos addObject:app];
        rank++;
        
    }
    
    return [NSArray arrayWithArray:[tempAppInfos autorelease]];
}

- (UIImage *)imageFromURL:(NSURL *)url
{
    return [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
}

@end
