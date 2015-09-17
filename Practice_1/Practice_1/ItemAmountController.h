//
//  AccumulatorController.h
//  Practice_1
//
//  Created by miyaeyo on 2015. 9. 17..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemAmountController : UIViewController

+(instancetype)controllerWithItemName:(NSString *)name
                          coordinateX:(CGFloat)x
                          coordinateY:(CGFloat)y;
- (IBAction)plusButtonTapped:(id)sender;
- (IBAction)minusButtonTapped:(id)sender;


@end
