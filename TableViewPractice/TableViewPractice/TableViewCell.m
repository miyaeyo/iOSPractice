//
//  TableViewCell.m
//  TableViewPractice
//
//  Created by miyaeyo on 2015. 9. 18..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
{
    UILabel *mRank;
    UIImageView *mThumbnail;
    UILabel *mAppName;
    UILabel *mAppCreator;
}


@synthesize rank = mRank;
@synthesize thumbnail = mThumbnail;
@synthesize appName = mAppName;
@synthesize appCreator = mAppCreator;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        mRank = [[UILabel alloc] initWithFrame:CGRectZero];
        mThumbnail = [[UIImageView alloc] initWithFrame:CGRectZero];
        mAppName = [[UILabel alloc] initWithFrame:CGRectZero];
        mAppCreator = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    
    return self;

}


- (void)awakeFromNib {
    
}


- (void)inputData:(AppInfomation *)appInfo
{
    [mRank setText:[NSString stringWithFormat:@"%d", [appInfo rank]]];
    [mThumbnail setImage:[appInfo thumbnail]];
    [mAppName setText:[appInfo appName]];
    [mAppCreator setText:[appInfo appCreator]];
}


- (void)layoutSubviews
{
    [mRank setFrame:CGRectMake(10, 8, 50, 50)];
    [mRank setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:mRank];
    
    [mThumbnail setFrame:CGRectMake(70, 8, 60, 60)];
    [self addSubview:mThumbnail];
    
    [mAppName setFrame:CGRectMake(140, 8, 200, 30)];
    [self addSubview:mAppName];
    
    [mAppCreator setFrame:CGRectMake(140, 43, 200, 30)];
    [self addSubview:mAppCreator];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [mRank release];
    [mThumbnail release];
    [mAppName release];
    [mAppCreator release];
    
    [super dealloc];
}

@end
