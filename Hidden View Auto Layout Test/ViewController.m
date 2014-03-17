//
//  ViewController.m
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 14/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "ViewController.h"
#import "UIView+HideConstraints.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.label1.text = @"1. Label";
	self.label2.text = @"2. Label";
	self.label3.text = @"3. Label";
}

- (IBAction)toggelText1:(id)sender {
	[self toggleLabel:self.label1 text:@"Test text 1"];
}
- (IBAction)toggleText2:(id)sender {
	[self toggleLabel:self.label2 text:@"Test text 2"];
}
- (IBAction)toggleText3:(id)sender {
	[self toggleLabel:self.label3 text:@"Test text 3"];
}

- (void)toggleLabel:(UILabel *)label text:(NSString *)text {

	if (label.text) {
		label.text = nil;
		label.hidden = YES;
	} else {
		label.text = text;
		label.hidden = NO;
	}

	[label dct_hideConstraints];
}

@end
