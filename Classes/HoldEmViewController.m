//
//  HoldEmViewController.m
//  HoldEm
//
//  Created by Billy Gray on 1/20/10.
//  Copyright Zetetic LLC 2010. All rights reserved.
//

#import "HoldEmViewController.h"

@implementation HoldEmViewController

@synthesize button, imageView;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (IBAction)tap:(id)sender {
	NSLog(@"tapped button");
	[button setHidden:YES];
}

- (void)holdingView:(id)view {
	NSLog(@"the image view was held down, show button");
	[button setHidden:NO];
}

- (void)dealloc {
	[imageView release];
	[button release];
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
