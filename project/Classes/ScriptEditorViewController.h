//
//  ScriptEditorViewController.h
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Intellicore. All rights reserved.
//

#import "Script.h"

#define ScriptEvalSegueID		@"ScriptEvalSegueID"


@interface ScriptEditorViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) Script *script;

@end
