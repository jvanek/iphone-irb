//
//  ScriptEvalViewController.m
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Intellicore. All rights reserved.
//

#import "ScriptEvalViewController.h"
#import "EvalRuby.h"


@interface ScriptEvalViewController ()

@end

@implementation ScriptEvalViewController

@synthesize script, resultView;

- (void)dealloc {
	self.script = nil;
	self.resultView = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.script = nil;
	self.resultView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.resultView.text = [[EvalRuby sharedInstance] eval:self.script.content];
}

@end
