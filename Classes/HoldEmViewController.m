//
//  HoldEmViewController.m
//  HoldEm
//
//  Created by Billy Gray on 1/20/10.
//  Copyright © 2010 Zetetic LLC. All rights reserved.
//
//	MIT-style License
//

#import "HoldEmViewController.h"

@implementation HoldEmViewController

@synthesize imageView, hiddenView;

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)holdingView:(id)view {
	[hiddenView setHidden:NO];
}

- (void)dealloc {
	[hiddenView release];
	[imageView release];
    [super dealloc];
}

# pragma mark -
# pragma mark UIResponder 

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSSet *imageTouches = [event touchesForView:imageView];
	if ([imageTouches count] > 0) {
		[self performSelector:@selector(holdingView:) withObject:imageView afterDelay:0.8f];
	}
	[super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSSet *imageTouches = [event touchesForView:imageView];
	if ([imageTouches count] > 0) {
		// stop any timer-based tracking... (remove from run loop)
		[NSObject cancelPreviousPerformRequestsWithTarget:self];
	}
	[super touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	NSSet *imageTouches = [event touchesForView:imageView];
	if ([imageTouches count] > 0) {
		[NSObject cancelPreviousPerformRequestsWithTarget:self];
	}
	[super touchesCancelled:touches withEvent:event];
}

@end
