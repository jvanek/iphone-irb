//
//  ScriptEditorViewController.h
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Pallas Software. All rights reserved.
//

#import "Script.h"

#define ScriptEvalSegueID		@"ScriptEvalSegueID"


@interface ScriptEditorViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *titleTextField;
@property (nonatomic, strong) IBOutlet UITextView *contentTextView;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) Script *script;

@end
