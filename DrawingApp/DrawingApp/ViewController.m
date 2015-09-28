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
#import "MyLine.h"

@implementation ViewController
{
    UILabel *mTitleLabel;
    DrawingView *mDrawingView;
    UIButton *mClearButton;
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
        [[self view] setBackgroundColor:[UIColor colorWithRed:0.97
                                                        green:0.87
                                                         blue:0.83
                                                        alpha:1]];

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
        mClearButton = nil;
        mColorButton = nil;
        mReplayButton = nil;
        // mRecoder release는 ARC로 설정해두면 여기서 불리는가???
    }
    
}


#pragma mark - DrawingDelegate


- (void)didStartDrawing:(MyPoint *)point
{
    [mRecoder storePoint:point isEdge:YES];
}


- (void)drawingWithPoint:(MyPoint *)point
{
    [mRecoder storePoint:point isEdge:NO];
    [self startDrawingWithLine:[mRecoder takeOutLines]];
}


#pragma mark - actions


- (IBAction)clearButtonTapped:(id)sender
{
    [mRecoder clear];
    [self startDrawingWithLine:[mRecoder takeOutLines]];
}


- (IBAction)changeColorButtonTapped:(id)sender
{
    [mDrawingView changeColor];
}


- (IBAction)replayButtonTapped:(id)sender
{
//    UIView *preview = [[UIView alloc] initWithFrame:[[self drawingView] frame]];
//    preview.backgroundColor = [UIColor whiteColor];
//    [[self view] addSubview:preview];
    
    
    [mDrawingView removeFromSuperview];
    
    [self setupDrawingView];
    
    NSMutableArray *tempLineStorage = [[NSMutableArray alloc] init];
    
    for (MyLine *line in [mRecoder takeOutLines])
    {
        [tempLineStorage addObject:line];
        
        NSTimeInterval delayInSeconds = line.end.time - line.start.time;
        [NSThread sleepForTimeInterval:delayInSeconds];
        [self startDrawingWithLine:tempLineStorage];
        
    }
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
    mClearButton = [UIButton myButtonWithTitle:@"CLEAR" target:self action:@selector(clearButtonTapped:)];
    mColorButton = [UIButton myButtonWithTitle:@"COLOR" target:self action:@selector(changeColorButtonTapped:)];
    mReplayButton= [UIButton myButtonWithTitle:@"REPLAY" target:self action:@selector(replayButtonTapped:)];
    
    [self setupButtonLayout];
}


- (void)setupButtonLayout
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    NSArray *buttons = @[mClearButton, mColorButton, mReplayButton];
    
    for (NSInteger i = 0; i < [buttons count]; i++)
    {
        UIButton *button = [buttons objectAtIndex:i];
        [button setFrame:CGRectMake(size.width * i / [buttons count], size.height - 50, size.width / [buttons count], 50)];
        [[self view] addSubview:button];
    }
}

- (void)startDrawingWithLine:(NSArray *)line
{
    [mDrawingView setLine:line];
    [mDrawingView didChangePoint];

}



@end
