//
//  ViewController.m
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 21..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"
#import "Line.h"


@interface ViewController ()

@end


@implementation ViewController
{
    UILabel *appTitle;
    DrawingView *drawingView;
    UIButton *draw;
    UIButton *complete;
    UIButton *replay;
    
    CGFloat screenWidth;
    CGFloat screenHeight;
    
    NSArray *lines;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    
    appTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, screenWidth, 50)];
    [self appTitleSetting];
    
    draw = [UIButton buttonWithType:UIButtonTypeSystem];
    complete = [UIButton buttonWithType:UIButtonTypeSystem];
    replay = [UIButton buttonWithType:UIButtonTypeSystem];
    [self menuButtonSetting];
}


- (void)appTitleSetting
{
    [appTitle setTextAlignment:NSTextAlignmentCenter];
    [appTitle setText:@"DoingDrawingDoing"];
    [appTitle setFont:[UIFont boldSystemFontOfSize:20]];
    [appTitle setTextColor:[UIColor colorWithRed:0.15 green:0.22 blue:0.16 alpha:1]];
    [[self view] addSubview:appTitle];

}

- (void)menuButtonSetting
{
    [draw setFrame:CGRectMake(0, screenHeight-50, screenWidth/3, 50)];
    [draw setTitle:@"DRAW" forState:UIControlStateNormal];
    [draw setTitleColor:[UIColor colorWithRed:0.57 green:0.31 blue:0.25 alpha:1]
               forState:UIControlStateNormal];
    [draw setBackgroundColor:[UIColor colorWithRed:0.8 green:0.85 blue:0.64 alpha:1]];
    [draw addTarget:self
             action:@selector(drawButtonTapped)
   forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:draw];

    
    [complete setFrame:CGRectMake(screenWidth/3, screenHeight-50, screenWidth/3, 50)];
    [complete setTitle:@"COMPLETE" forState:UIControlStateNormal];
    [complete setTitleColor:[UIColor colorWithRed:0.57 green:0.31 blue:0.25 alpha:1]
               forState:UIControlStateNormal];
    [complete setBackgroundColor:[UIColor colorWithRed:0.8 green:0.85 blue:0.64 alpha:1]];
    [complete addTarget:self
                 action:@selector(completeButtonTapped)
       forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:complete];
    
    
    [replay setFrame:CGRectMake(screenWidth*2/3, screenHeight-50, screenWidth/3, 50)];
    [replay setTitle:@"REPLAY" forState:UIControlStateNormal];
    [replay setTitleColor:[UIColor colorWithRed:0.57 green:0.31 blue:0.25 alpha:1]
               forState:UIControlStateNormal];
    [replay setBackgroundColor:[UIColor colorWithRed:0.8 green:0.85 blue:0.64 alpha:1]];
    [replay addTarget:self
               action:@selector(replayButtonTapped)
     forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:replay];
}


- (void)drawButtonTapped
{
    drawingView = [[DrawingView alloc] initWithFrame:CGRectMake(0, 70, screenWidth, screenHeight-120)];
    [[self view] addSubview:drawingView];
}


- (void)completeButtonTapped
{
    lines = [[NSArray arrayWithArray:[drawingView lines]] retain];
    [drawingView clearDrawingView];

}


- (void)replayButtonTapped
{
    [drawingView replayDrawingLines:lines];
    [lines release];
    
}


- (void)didReceiveMemoryWarning {
    
    if ([self isViewLoaded] && [self.view window] == nil) {
        [appTitle release];
        [drawingView release];
        self.view = nil;
    }
    
    [super didReceiveMemoryWarning];
    
}

@end
