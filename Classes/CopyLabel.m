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
	NSLog(@"doing my best....");
	// bring up editing menu.
	UIMenuController *theMenu = [UIMenuController sharedMenuController];
	//CGRect selectionRect = CGRectMake(currentSelection.x, currentSelection.y, SIDE, SIDE);
	//[theMenu setTargetRect:selectionRect inView:self];
	[theMenu setMenuVisible:YES animated:YES];
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
