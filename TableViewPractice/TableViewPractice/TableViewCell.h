//
//  TableViewCell.h
//  TableViewPractice
//
//  Created by miyaeyo on 2015. 9. 18..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AppInfomation.h"

@interface TableViewCell : UITableViewCell

@property (nonatomic, readonly) UILabel *rank;
@property (nonatomic, readonly) UIImageView *thumbnail;
@property (nonatomic, readonly) UILabel *appName;
@property (nonatomic, readonly) UILabel *appCreator;

- (void)inputData:(AppInfomation *)appInfo;


@end
