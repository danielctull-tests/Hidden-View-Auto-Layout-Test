//
//  UIView+HideConstraints.m
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 17/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "UIView+HideConstraints.h"
#import "LayoutConstraint.h"
#import <objc/runtime.h>

@implementation UIView (HideConstraints)

- (void)setDct_collapsed:(BOOL)dct_collapsed {
	objc_setAssociatedObject(self, @selector(dct_collapsed), @(dct_collapsed), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	[self dct_hideConstraints];
}

- (BOOL)dct_collapsed {
    NSNumber *collapsed = objc_getAssociatedObject(self, @selector(dct_collapsed));
	return [collapsed boolValue];
}

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

		constraint.collapsed = (view.dct_collapsed || otherItem.dct_collapsed);
	}

	[self.superview dct_hideConstraintsForView:view];
}

@end
