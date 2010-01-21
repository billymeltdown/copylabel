//
//  HoldEmAppDelegate.m
//  HoldEm
//
//  Created by Billy Gray on 1/20/10.
//  Copyright Zetetic LLC 2010. All rights reserved.
//

#import "HoldEmAppDelegate.h"
#import "HoldEmViewController.h"

@implementation HoldEmAppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
