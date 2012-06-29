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
	contentDidChange = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	NSError *err = nil;
	if (contentDidChange) {
		self.script.title = self.titleTextField.text;
		self.script.content = self.contentTextView.text;
		if ([self.managedObjectContext hasChanges]) {
			LOG_DEBUG(@"saving changes");
			self.script.modifDate = [NSDate date];
			if (![self.managedObjectContext save:&err]) {
				if (err != nil) LOG_ERROR(@"error saving script %@: %@", self.script.title, [err localizedDescription]);
				else LOG_ERROR(@"error saving script %@", self.script.title);
			} else [self.managedObjectContext processPendingChanges];
		}
	}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([ScriptEvalSegueID isEqualToString:segue.identifier]) {
		((ScriptEvalViewController *)segue.destinationViewController).script = self.script;
	}
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	if (!contentDidChange) contentDidChange = YES;
	return YES;
}

#pragma mark - UITextView delegate

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
	[textView resignFirstResponder];
	return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	if (!contentDidChange) contentDidChange = YES;
	return YES;
}

@end
