//
//  LayoutConstraint.m
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 14/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "LayoutConstraint.h"

@interface LayoutConstraint ()
@property (nonatomic) CGFloat initialConstant;
@end

@implementation LayoutConstraint

- (void)awakeFromNib {
	[super awakeFromNib];
	self.initialConstant = self.constant;
}

- (void)setHidden:(BOOL)hidden {
	_hidden = hidden;

	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		self.initialConstant = self.constant;
	});

	self.constant = _hidden ? 0.0f : self.initialConstant;
}

@end
