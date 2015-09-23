//
//  UIButton+MyButton.h
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 22..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (MyButton)


+ (UIButton *)myButtonWithTitle:(NSString *)aTitle target:(id)aTarget action:(SEL)aAction;


@end
