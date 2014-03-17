//
//  LayoutConstraint.m
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 14/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "LayoutConstraint.h"

@interface LayoutConstraint ()
@property (nonatomic) CGFloat originalConstant;
@end

@implementation LayoutConstraint

- (void)awakeFromNib {
	[super awakeFromNib];
	self.originalConstant = self.constant;
}

- (void)setCollapsed:(BOOL)collapsed {
	_collapsed = collapsed;
	self.constant = _collapsed ? 0.0f : self.originalConstant;
}

@end
