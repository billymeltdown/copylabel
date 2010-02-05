//
//  CopyLabel.h
//  HoldEm
//
//  Created by Billy Gray on 1/20/10.
//  Copyright © 2010 Zetetic LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CopyLabel : UILabel {
	CGPoint holdPoint;
	UIColor *_bgColor;
}

- (void)showMenu;
- (void)reset;

@end
