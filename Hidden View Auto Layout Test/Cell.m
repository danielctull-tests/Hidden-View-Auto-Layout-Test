//
//  Cell.m
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 14/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "Cell.h"

@interface Cell ()
@property (nonatomic, weak) IBOutlet UILabel *headerLabel;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;
@property (nonatomic, weak) IBOutlet UILabel *bodyLabel;
@end

@implementation Cell

+ (instancetype)sizingCell {
	static Cell *sizingCell;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		UINib *nib = [UINib nibWithNibName:NSStringFromClass(self) bundle:nil];
		NSArray *views = [nib instantiateWithOwner:nil options:nil];
		sizingCell = [views firstObject];
	});
	return sizingCell;
}

- (void)setHeader:(NSString *)header {
	_header = [header copy];
	self.headerLabel.text = _header;
	self.headerLabel.hidden = (_header == nil);
}

- (void)setBody:(NSString *)body {
	_body = [body copy];
	self.bodyLabel.text = _body;
	self.bodyLabel.hidden = (_body == nil);
}

- (void)setDate:(NSString *)date {
	_date = [date copy];
	self.dateLabel.text = _date;
	self.dateLabel.hidden = (_date == nil);
}

@end
