//
//  MenuViewController.m
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Pallas Software. All rights reserved.
//

#import "MenuViewController.h"
#import "ScriptListViewController.h"
#import "UIButton+EasyTitle.h"


@interface MenuViewController ()

@end



@implementation MenuViewController

@synthesize quickEvalBtn, scriptEvalBtn;

- (void)dealloc {
	self.quickEvalBtn = nil;
	self.scriptEvalBtn = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.title = LOCALIZED_STRING(@"iRuby");
	[self.quickEvalBtn setTitleForAllStates:LOCALIZED_STRING(@"Quick Eval")];
	[self.scriptEvalBtn setTitleForAllStates:LOCALIZED_STRING(@"Script Eval")];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.quickEvalBtn = nil;
	self.scriptEvalBtn = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([ScriptEvalSegueID isEqualToString:segue.identifier]) {
		((ScriptListViewController *)segue.destinationViewController).managedObjectContext = APP_DELEGATE.managedObjectContext;
	}
}

@end
