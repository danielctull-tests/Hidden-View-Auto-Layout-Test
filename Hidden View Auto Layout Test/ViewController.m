//
//  ViewController.m
//  Hidden View Auto Layout Test
//
//  Created by Daniel Tull on 14/03/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	self.label1.text = @"1. 34l;dfj";
	self.label2.text = @"2. sdfds92384";
	self.label3.text = @"3. 92384";
}

- (IBAction)toggelText1:(id)sender {
	NSString *text = self.label1.text;
	text = (text == nil) ? @"Test text 1" : nil;
	self.label1.text = text;
}
- (IBAction)toggleText2:(id)sender {
	NSString *text = self.label2.text;
	text = (text == nil) ? @"Test text 2" : nil;
	self.label2.text = text;
}
- (IBAction)toggleText3:(id)sender {
	NSString *text = self.label3.text;
	text = (text == nil) ? @"Test text 3" : nil;
	self.label3.text = text;
}

@end
