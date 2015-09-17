//
//  AccumulatorController.m
//  Practice_1
//
//  Created by miyaeyo on 2015. 9. 17..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "ItemAmountController.h"
#import "Accumulator.h"

@interface ItemAmountController ()

@end

@implementation ItemAmountController
{
    Accumulator *accumulator;
    UILabel *item;
    UILabel *amount;
    UIButton *button;
    CGFloat coordinateX;
    CGFloat coordinateY;
    
    NSString *itemName;
}

+(instancetype)controllerWithItemName:(NSString *)name
                          coordinateX:(CGFloat)x
                          coordinateY:(CGFloat)y
{
    return [[[self alloc] initWithItemName:name coordinateX:x coordinateY:y] autorelease];
}

- (instancetype)initWithItemName:(NSString *)name
                     coordinateX:(CGFloat)x
                     coordinateY:(CGFloat)y
{
    self = [super init];
    
    if (self)
    {
        itemName = [name retain];
        coordinateX = x;
        coordinateY = y;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    accumulator = [[Accumulator alloc] init];
    
    [[self view] setFrame:CGRectMake(coordinateX, coordinateY, 250, 70)];
    
    item = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 60)];
    [item setTextAlignment:NSTextAlignmentRight];
    [item setText:itemName];
    [item setTextColor:[UIColor blackColor]];
    [[self view] addSubview:item];
    
    amount = [[UILabel alloc] initWithFrame:CGRectMake(75, 0, 60, 60)];
    [amount setTextAlignment:NSTextAlignmentCenter];
    [amount setText:@"0"];
    [amount setTextColor:[UIColor brownColor]];
    [amount setBackgroundColor:[UIColor whiteColor]];
    [[self view] addSubview:amount];
    
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(140, 0, 60, 60)];
    [button setTitle:@"+" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor]];
    [button addTarget:self
               action:@selector(plusButtonTapped:)
     forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(205, 0, 60, 60)];
    [button setTitle:@"-" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor]];
    [button addTarget:self
               action:@selector(minusButtonTapped:)
     forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)plusButtonTapped:(id)sender
{
    [accumulator increaseCount];
    [amount setText:[NSString stringWithFormat:@"%d", [accumulator count]]];
}

- (IBAction)minusButtonTapped:(id)sender
{
    [accumulator decreaseCount];
    [amount setText:[NSString stringWithFormat:@"%d", [accumulator count]]];
}

- (void)dealloc
{
    [accumulator release];
    [item release];
    [amount release];
    [itemName release];
    
    [super dealloc];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
