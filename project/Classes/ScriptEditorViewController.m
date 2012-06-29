//
//  ScriptEditorViewController.m
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Intellicore. All rights reserved.
//

#import "ScriptEditorViewController.h"
#import "ScriptEvalViewController.h"


@interface ScriptEditorViewController () {
	BOOL contentDidChange;
}

@end


@implementation ScriptEditorViewController

@synthesize script, managedObjectContext;
@synthesize titleTextField, contentTextView;

- (void)viewDidLoad {
    [super viewDidLoad];
	contentDidChange = NO;
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.script = nil;
	self.managedObjectContext = nil;
	self.titleTextField = nil;
	self.contentTextView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.titleTextField.text = self.script.title;
	self.contentTextView.text = self.script.content;
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];

	if (contentDidChange) self.script.content = self.contentTextView.text;

	NSError *err = nil;
	if ([self.managedObjectContext hasChanges]) {
		self.script.modifDate = [NSDate date];
		[self.managedObjectContext save:&err];
	}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([ScriptEvalSegueID isEqualToString:segue.identifier]) {
		((ScriptEvalViewController *)segue.destinationViewController).script = self.script;
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	self.script.title = textField.text;
	[textField resignFirstResponder];
	return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
	[textView resignFirstResponder];
	return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	if (!contentDidChange) contentDidChange = YES;
	return YES;
}

@end
