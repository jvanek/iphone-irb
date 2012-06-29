//
//  ScriptEditorViewController.m
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Intellicore. All rights reserved.
//

#import "ScriptEditorViewController.h"
#import "ScriptEvalViewController.h"


@interface ScriptEditorViewController ()

@end


@implementation ScriptEditorViewController

@synthesize script, managedObjectContext;

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];

	NSError *err = nil;
	if ([self.managedObjectContext hasChanges]) [self.managedObjectContext save:&err];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([ScriptEvalSegueID isEqualToString:segue.identifier]) {
		((ScriptEvalViewController *)segue.destinationViewController).script = self.script;
	}
}

@end
