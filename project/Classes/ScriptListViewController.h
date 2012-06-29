//
//  ScriptListViewController.h
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Intellicore. All rights reserved.
//


#define ScriptEditorSegueID		@"ScriptEditorSegueID"


@interface ScriptListViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
