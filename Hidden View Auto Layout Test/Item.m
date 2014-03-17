//
//  Item.m
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 14/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "Item.h"

@implementation Item

- (instancetype)initWithHeader:(NSString *)header body:(NSString *)body date:(NSString *)date {
	self = [self init];
	if (!self) return nil;
	_header = [header copy];
	_body = [body copy];
	_date = [date copy];
	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"<%@: %p; header = %@; body = %@; date = %@>",
			NSStringFromClass([self class]),
			self,
			self.header,
			self.body,
			self.date];
}

@end
