//
//  ViewController.m
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 21..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UILabel *appTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, screenRect.size.width, 50)];
    [appTitle setTextAlignment:NSTextAlignmentCenter];
    [appTitle setText:@"DoingDrawingDoing"];
    [appTitle setFont:[UIFont boldSystemFontOfSize:20]];
    [appTitle setTextColor:[UIColor colorWithRed:0.49 green:0.36 blue:0.34 alpha:1]];
    [[self view] addSubview:appTitle];
    
    DrawingView *view = [[DrawingView alloc]initWithFrame:CGRectMake(0, 70, screenRect.size.width, screenRect.size.height-120)];
    [[self view] addSubview:view];
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
