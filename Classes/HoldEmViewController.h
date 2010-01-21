//
//  HoldEmViewController.h
//  HoldEm
//
//  Created by Billy Gray on 1/20/10.
//  Copyright Zetetic LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HoldEmViewController : UIViewController {
	UIButton *button;
	UIImageView *imageView;
	BOOL trackingTouch;
	NSTimeInterval touchStart;
}

@property (nonatomic, retain) IBOutlet UIButton *button;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

- (IBAction)tap:(id)sender;
- (void)holdingView:(id)view;

@end

