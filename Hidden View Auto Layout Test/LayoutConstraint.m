//
//  LayoutConstraint.m
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 14/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "LayoutConstraint.h"

@implementation LayoutConstraint

- (CGFloat)constant {

	UIView *firstItem = self.firstItem;
	UIView *secondItem = self.secondItem;
	if (firstItem.hidden || secondItem.hidden) return 0.0f;

	return [super constant];
}

@end
