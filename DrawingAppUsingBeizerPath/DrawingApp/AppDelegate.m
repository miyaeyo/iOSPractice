//
//  AppDelegate.m
//  DrawingApp
//
//  Created by miyaeyo on 2015. 9. 28..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window makeKeyAndVisible];
    [self setWindow:window];
    
    
    ViewController *viewController = [[ViewController alloc] initWithNibName:Nil bundle:Nil];
    [[self window] setRootViewController:viewController];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
