//
//  CopyLabel.m
//  HoldEm
//
//  Created by Billy Gray on 1/20/10.
//  Copyright 2010 Zetetic LLC. All rights reserved.
//

#import "CopyLabel.h"

@implementation CopyLabel

- (void)showCopyMenu {
	NSLog(@"I'm tryin' Ringo, I'm tryin' reeeeal hard.");
	// bring up editing menu.
	UIMenuController *theMenu = [UIMenuController sharedMenuController];
	//CGRect selectionRect = CGRectMake(currentSelection.x, currentSelection.y, SIDE, SIDE);
	CGRect selectionRect = [self frame];
	[theMenu setTargetRect:selectionRect inView:self];
	[theMenu setMenuVisible:YES animated:YES];
}

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
	[self performSelector:@selector(showCopyMenu) withObject:nil afterDelay:0.8f];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showCopyMenu) object:nil];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showCopyMenu) object:nil];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showCopyMenu) object:nil];
}

@end
