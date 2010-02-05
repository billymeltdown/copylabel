//
//  HoldEmViewController.h
//  HoldEm
//
//  Created by Billy Gray on 1/20/10.
//  Copyright © 2010 Zetetic LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HoldEmViewController : UIViewController {
	UIView *hiddenView;
	UIImageView *imageView;
}

@property (nonatomic, retain) IBOutlet UIView *hiddenView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

- (void)holdingView:(id)view;

@end

