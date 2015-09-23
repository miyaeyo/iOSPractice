//
//  ViewController.m
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 23..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"
#import "Recoder.h"
#import "UIButton+MyButton.h"

@implementation ViewController
{
    UILabel *mTitleLabel;
    DrawingView *mDrawingView;
    UIButton *mDrawButton;
    UIButton *mColorButton;
    UIButton *mReplayButton;
    
    Recoder *mRecoder;
}


#pragma mark - init


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        mRecoder = [[Recoder alloc] init];
        [mRecoder setDelegate:self];
    }
    
    return self;
}


#pragma mark - viewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTitleLabel];
    [self setupDrawingView];
    [self setupButtons];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    if ([self isViewLoaded] && [self.view window] == nil)
    {
        mTitleLabel = nil;
        mDrawingView = nil;
        mDrawButton = nil;
        mColorButton = nil;
        mReplayButton = nil;
        // mRecoder release는 여기서 불리는가???
    }
    
}


#pragma mark - DrawingDelegate


- (void)didStartDrawingWithPoint:(MyPoint *)point
{
    [mRecoder storePoint:point];
}
- (void)DrawingWithline:(NSArray *)line
{
    
}
- (void)didDrawingEnd
{
    
}


#pragma mark - actions


- (IBAction)drawButtonTapped:(id)sender
{
    [mRecoder draw];
}


- (IBAction)changeColorButtonTapped:(id)sender
{
    [mRecoder changeColor];
}


- (IBAction)replayButtonTapped:(id)sender
{
    [mRecoder replay];
}



#pragma mark - private


- (void)setupTitleLabel
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    mTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, screenSize.width, 50)];
    [mTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [mTitleLabel setText:@"DoingDrawingDoing"];
    [mTitleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [mTitleLabel setTextColor:[UIColor colorWithRed:0.15 green:0.22 blue:0.16 alpha:1]];
    [[self view] addSubview:mTitleLabel];
    
}


- (void)setupDrawingView
{
    CGSize screenSize = [[self view] bounds].size;
    
    mDrawingView = [[DrawingView alloc] initWithFrame:CGRectMake(0, 70, screenSize.width, screenSize.height - 120)];
    [mDrawingView setDelegate:self];
    [[self view] addSubview:mDrawingView];
}


- (void)setupButtons
{
    mDrawButton = [UIButton myButtonWithTitle:@"DRAW" target:self action:@selector(drawButtonTapped:)];
    mColorButton = [UIButton myButtonWithTitle:@"COLOR" target:self action:@selector(changeColorButtonTapped:)];
    mReplayButton= [UIButton myButtonWithTitle:@"REPLAY" target:self action:@selector(replayButtonTapped:)];
    
    [self setupButtonLayout];
}


- (void)setupButtonLayout
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    NSArray *buttons = @[mDrawButton, mColorButton, mReplayButton];
    
    for (NSInteger i = 0; i < [buttons count]; i++)
    {
        UIButton *button = [buttons objectAtIndex:i];
        [button setFrame:CGRectMake(size.width * i / [buttons count], size.height - 50, size.width / [buttons count], 50)];
        [[self view] addSubview:button];
    }
}



@end
