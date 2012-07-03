//
//  MenuViewController.h
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Pallas Software. All rights reserved.
//

#define QuickEvalSegueID		@"QuickEvalSegueID"
#define ScriptEvalSegueID		@"ScriptEvalSegueID"

@interface MenuViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *quickEvalBtn;
@property (nonatomic, strong) IBOutlet UIButton *scriptEvalBtn;

@end
