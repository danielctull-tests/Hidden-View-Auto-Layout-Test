//
//  UIView+HideConstraints.m
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 17/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "UIView+HideConstraints.h"
#import "LayoutConstraint.h"

@implementation UIView (HideConstraints)

- (void)dct_hideConstraints {
	[self dct_hideConstraintsForView:self];
}

- (void)dct_hideConstraintsForView:(UIView *)view {

	for (LayoutConstraint *constraint in self.constraints) {

		if (![constraint isKindOfClass:[LayoutConstraint class]]) continue;

		BOOL isFirstItem = [constraint.firstItem isEqual:view];
		BOOL isSecondItem = [constraint.secondItem isEqual:view];

		if (!isFirstItem && !isSecondItem) continue;

		UIView *otherItem;
		if (isFirstItem)
			otherItem = constraint.secondItem;
		else
			otherItem = constraint.firstItem;

		if (![otherItem isKindOfClass:[UIView class]]) continue;

		constraint.hidden = (view.hidden || otherItem.hidden);
	}

	[self.superview dct_hideConstraintsForView:view];
}

@end
