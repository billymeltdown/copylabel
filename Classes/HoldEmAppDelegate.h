//
//  HoldEmAppDelegate.h
//  HoldEm
//
//  Created by Billy Gray on 1/20/10.
//  Copyright © 2010 Zetetic LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HoldEmViewController;

@interface HoldEmAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HoldEmViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet HoldEmViewController *viewController;

@end

