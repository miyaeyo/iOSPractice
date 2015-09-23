//
//  UIButton+MyButton.m
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 22..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "UIButton+MyButton.h"

@implementation UIButton (MyButton)


+ (UIButton *)myButtonWithTitle:(NSString *)aTitle target:(id)aTarget action:(SEL)aAction
{
    UIButton *result = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [result setTitle:aTitle forState:UIControlStateNormal];
    [result setTitleColor:[UIColor colorWithRed:0.57 green:0.31 blue:0.25 alpha:1]
                 forState:UIControlStateNormal];
    [result setBackgroundColor:[UIColor colorWithRed:0.8 green:0.85 blue:0.64 alpha:1]];
    [result addTarget:aTarget action:aAction forControlEvents:UIControlEventTouchUpInside];
    
    return result;
}


@end
