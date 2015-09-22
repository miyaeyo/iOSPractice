//
//  AppDelegate.m
//  UIResponderPractice
//
//  Created by miyaeyo on 2015. 9. 21..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"launch");

    
    UIWindow *window  = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]] autorelease];
    [window makeKeyAndVisible];
    [self setWindow:window];
    
    
    ViewController *viewController = [[[ViewController alloc] init] autorelease];
    [[self window] setBackgroundColor:[UIColor colorWithRed:0.97 green:0.87 blue:0.83 alpha:1]];
    [[self window] setRootViewController:viewController];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}
    
- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
   
}

@end
