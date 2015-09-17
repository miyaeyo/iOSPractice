//
//  AppDelegate.m
//  Practice_1
//
//  Created by miyaeyo on 2015. 9. 10..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    UIWindow *mWindow;
}

@synthesize window = mWindow;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"launch");
    
    UIWindow *window  = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]] autorelease];
    [window makeKeyAndVisible];
    [self setWindow:window];
    [window setBackgroundColor:[UIColor blueColor]];
    
    ViewController *viewController = [[[ViewController alloc] init] autorelease];
    [[self window] setRootViewController:viewController];
    [[viewController view] setBackgroundColor:[UIColor yellowColor]];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"application will resign actiive");

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"application did enter background");

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"application will enter foreground");

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"application did become active");
   
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"application will terminate");
}

@end
