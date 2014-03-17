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
	self.headerLabel.dct_collapsed = (_header.length == 0);
}

- (void)setBody:(NSString *)body {
	_body = [body copy];
	self.bodyLabel.text = _body;
	self.bodyLabel.dct_collapsed = (_body.length == 0);
}

- (void)setDate:(NSString *)date {
	_date = [date copy];
	self.dateLabel.text = _date;
	self.dateLabel.dct_collapsed = (_date.length == 0);
}

@end
