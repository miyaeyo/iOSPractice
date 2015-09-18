//
//  AppDelegate.m
//  TableViewPractice
//
//  Created by miyaeyo on 2015. 9. 18..
//  Copyright (c) 2015년 miyaeyo. All rights reserved.
//

#import "AppDelegate.h"
#import "TableViewController.h"

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
    
    
    TableViewController *viewController = [[[TableViewController alloc] init] autorelease];
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
