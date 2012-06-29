//
//  MenuViewController.m
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Intellicore. All rights reserved.
//

#import "MenuViewController.h"
#import "ScriptListViewController.h"


@interface MenuViewController ()

@end



@implementation MenuViewController


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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([ScriptEvalSegueID isEqualToString:segue.identifier]) {
		((ScriptListViewController *)segue.destinationViewController).managedObjectContext = APP_DELEGATE.managedObjectContext;
	}
}

@end
