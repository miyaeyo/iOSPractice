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
#import "Recorder.h"
#import "UIButton+MyButton.h"


@implementation ViewController
{
    UILabel *titleLabel;
    DrawingView *drawingView;
    UIButton *drawButton;
    UIButton *changeColorButton;
    UIButton *replayButton;
    
    Recorder *recorder;
}


#pragma mark - init/dealloc


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        recorder = [[Recorder alloc] init];
    }
    
    return self;
}


- (void)dealloc
{
    [recorder release];

    [super dealloc];
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
    
    if ([self isViewLoaded] && [self.view window] == nil) {
        titleLabel = nil;
        drawingView = nil;
        drawButton = nil;
        changeColorButton = nil;
        replayButton = nil;
    }
}


#pragma mark - actions


- (IBAction)drawButtonTapped:(id)sender
{
    [drawingView clear];
}


- (IBAction)changeColorButtonTapped:(id)sender
{
    [drawingView changeColor];
}


- (IBAction)replayButtonTapped:(id)sender
{
    [recorder setLines:[drawingView lines]];
    [drawingView replayWithLines:[recorder lines]];
}


#pragma mark - private


- (void)setupTitleLabel
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    titleLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 20, screenSize.width, 50)] autorelease];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setText:@"DoingDrawingDoing"];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [titleLabel setTextColor:[UIColor colorWithRed:0.15 green:0.22 blue:0.16 alpha:1]];
    [[self view] addSubview:titleLabel];
    
}


- (void)setupDrawingView
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    drawingView = [[[DrawingView alloc] initWithFrame:CGRectMake(0, 70, screenSize.width, screenSize.height - 120)] autorelease];
    [[self view] addSubview:drawingView];
}


- (void)setupButtons
{
    drawButton = [UIButton myButtonWithTitle:@"DRAW" target:self action:@selector(drawButtonTapped:)];
    changeColorButton = [UIButton myButtonWithTitle:@"COLOR" target:self action:@selector(changeColorButtonTapped:)];
    replayButton = [UIButton myButtonWithTitle:@"REPLAY" target:self action:@selector(replayButtonTapped:)];
    
    [self setupButtonLayout];
}


- (void)setupButtonLayout
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    NSArray *buttons = @[drawButton, changeColorButton, replayButton];

    for (NSInteger i = 0; i < [buttons count]; i++)
    {
        UIButton *button = [buttons objectAtIndex:i];
        [button setFrame:CGRectMake(size.width * i / [buttons count], size.height - 50, size.width / [buttons count], 50)];
        [[self view] addSubview:button];
    }
}


@end