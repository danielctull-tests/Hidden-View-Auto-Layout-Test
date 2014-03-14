//
//  Label.m
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 14/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "Label.h"
#import "LayoutConstraint.h"

@interface Label ()
@property (nonatomic) IBOutletCollection(LayoutConstraint) NSArray *collapsableConstraints;
@end

@implementation Label

- (void)setText:(NSString *)text {
	[super setText:text];

	for (LayoutConstraint *constraint in self.collapsableConstraints) {
		constraint.hidden = (text == nil);
	}
}

@end
