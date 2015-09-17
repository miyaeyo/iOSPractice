//
//  ViewController.m
//  Practice_1
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "ViewController.h"
#import "ItemAmountController.h"


@interface ViewController ()

@end

@implementation ViewController
{
    
    ItemAmountController *childViewController1;
    ItemAmountController *childViewController2;
    ItemAmountController *childViewController3;
    
    UILabel *title;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor yellowColor]];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    title = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, screenRect.size.width, 40)];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setText:@"* Shopping cart *"];
    [[self view] addSubview:title];
    
    
    childViewController1 = [ItemAmountController controllerWithItemName:@"jean"
                                                            coordinateX:10
                                                            coordinateY:100];
    [self addChildViewController:childViewController1];
    [[self view] addSubview:[childViewController1 view]];
    
    childViewController2 = [ItemAmountController controllerWithItemName:@"shirt"
                                                            coordinateX:10
                                                            coordinateY:170];
    [self addChildViewController:childViewController2];
    [[self view] addSubview:[childViewController2 view]];

    
    childViewController3 = [ItemAmountController controllerWithItemName:@"cap"
                                                            coordinateX:10
                                                            coordinateY:240];
    [self addChildViewController:childViewController3];    
    [[self view] addSubview:[childViewController3 view]];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
