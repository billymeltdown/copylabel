//
//  CopyLabel.m
//  HoldEm
//
//  Created by Billy Gray on 1/20/10.
//  Copyright 2010 Zetetic LLC. All rights reserved.
//

#import "CopyLabel.h"

@implementation CopyLabel

- (void)showMenu {
	NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
	[center addObserver:self selector:@selector(reset) name:UIMenuControllerWillHideMenuNotification object:nil];
	
	// bring up editing menu.
	UIMenuController *theMenu = [UIMenuController sharedMenuController];
	CGRect myFrame = [[self superview] frame];
	CGRect selectionRect = CGRectMake(holdPoint.x, myFrame.origin.y - 12.0, 0, 0);
	
	[self setNeedsDisplayInRect:selectionRect];
	[theMenu setTargetRect:selectionRect inView:self];
	[theMenu setMenuVisible:YES animated:YES];
	
	[self setBackgroundColor:[UIColor colorWithRed:255.0 green:235.0 blue:180.0 alpha:0.8]];
}

- (void)reset {
	[self setBackgroundColor:nil];
	NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
	[center removeObserver:self name:UIMenuControllerWillHideMenuNotification object:nil];
}

- (void)copy:(id)sender {
    UIPasteboard *gpBoard = [UIPasteboard generalPasteboard];
	[gpBoard setValue:[self text] forPasteboardType:@"public.utf8-plain-text"];
}

// UIMenuControllerDidHideMenuNotification is what we want for running reset...

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
	BOOL answer = NO;
	
	if (action == @selector(copy:))
		answer = YES;
	
	return answer;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if ([self canBecomeFirstResponder]) {
		[self becomeFirstResponder];
		UITouch *t = [touches anyObject];
		holdPoint = [t locationInView:self];
		[self performSelector:@selector(showMenu) withObject:nil afterDelay:0.8f];
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showMenu) object:nil];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showMenu) object:nil];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showMenu) object:nil];
}

#pragma mark -
#pragma mark Motion-event handling

/*
 Custom views should implement all motion-event handlers, even if it's a null implementation, and not call super.
 */

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	return;
}


// Shaking resets board.
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	if (motion = UIEventSubtypeMotionShake ) {
		[self reset];
	}
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	return;
}

# pragma mark -

- (void)dealloc {
	// make sure we're unregistered for notifications
	NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
	[center removeObserver:self name:UIMenuControllerWillHideMenuNotification object:nil];
	[super dealloc];
}

@end
