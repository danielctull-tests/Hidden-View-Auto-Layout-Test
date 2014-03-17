//
//  Cell.m
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 14/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "Cell.h"
#import "UIView+HideConstraints.h"

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
	self.headerLabel.hidden = (_header.length == 0);
	[self.headerLabel dct_hideConstraints];
}

- (void)setBody:(NSString *)body {
	_body = [body copy];
	self.bodyLabel.text = _body;
	self.bodyLabel.hidden = (_body.length == 0);
	[self.bodyLabel dct_hideConstraints];
}

- (void)setDate:(NSString *)date {
	_date = [date copy];
	self.dateLabel.text = _date;
	self.dateLabel.hidden = (_date.length == 0);
	[self.dateLabel dct_hideConstraints];
}

@end
