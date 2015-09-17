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
    [self setContentController:childViewController1];
    
    
    childViewController2 = [ItemAmountController controllerWithItemName:@"shirt"
                                                            coordinateX:10
                                                            coordinateY:170];
    [self setContentController:childViewController2];


    
    childViewController3 = [ItemAmountController controllerWithItemName:@"cap"
                                                            coordinateX:10
                                                            coordinateY:240];
    [self setContentController:childViewController3];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setContentController:(id)contentController
{
    [self addChildViewController:contentController];
    [[self view] addSubview:[contentController view]];
}


@end
