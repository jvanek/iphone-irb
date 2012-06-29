//
//  ScriptListViewController.m
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Intellicore. All rights reserved.
//

#import "ScriptListViewController.h"
#import "Script.h"
#import "ScriptEditorViewController.h"



@interface ScriptListViewController ()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) Script *selectedScript;

- (void)addNewScript:(UIBarButtonItem *)sender;
- (void)reloadData;

@end




@implementation ScriptListViewController

@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize managedObjectContext, dateFormatter, selectedScript;

- (void)viewDidLoad {
    [super viewDidLoad];

	self.dateFormatter = [[NSDateFormatter alloc] init];
	self.dateFormatter.formatterBehavior = NSDateFormatterBehavior10_4;
	self.dateFormatter.dateFormat = @"dd/MM/yyyy";

    // Uncomment the following line to preserve selection between presentations.
	self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewScript:)];
	[self reloadData];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.fetchedResultsController = nil;
	if ([self.managedObjectContext hasChanges]) [self.managedObjectContext reset];
	self.managedObjectContext = nil;
	self.dateFormatter = nil;
	self.selectedScript = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([ScriptEditorSegueID isEqualToString:segue.identifier]) {
		((ScriptEditorViewController *)segue.destinationViewController).managedObjectContext = self.managedObjectContext;
		((ScriptEditorViewController *)segue.destinationViewController).script = self.selectedScript;
	}
}

- (NSFetchedResultsController *)fetchedResultsController {
	if (_fetchedResultsController == nil) {
		NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:SCRIPT_ENTITY_NAME];
		NSArray *descriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:SCRIPT_KEY_TITLE ascending:YES]];
		[req setSortDescriptors:descriptors];
		_fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:req
																		managedObjectContext:self.managedObjectContext
																		  sectionNameKeyPath:nil
																				   cacheName:nil];
		_fetchedResultsController.delegate = self;
	}
	return _fetchedResultsController;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    return [self.fetchedResultsController.sections count];
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController.sections objectAtIndex:section];
	return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:ScriptCellID];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	Script *aScript = [self.fetchedResultsController objectAtIndexPath:indexPath];
	cell.textLabel.text = aScript.title;
	if (aScript.modifDate != nil) cell.detailTextLabel.text = [self.dateFormatter stringFromDate:aScript.modifDate];
	else cell.detailTextLabel.text = LOCALIZED_STRING(@"New");
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
		[self.managedObjectContext deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
		[self reloadData];
        [aTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)aTableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)aTableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	[aTableView deselectRowAtIndexPath:indexPath animated:YES];
	self.selectedScript = [self.fetchedResultsController objectAtIndexPath:indexPath];
}

#pragma mark - Private methods

- (void)addNewScript:(UIBarButtonItem *)sender {
	[NSEntityDescription insertNewObjectForEntityForName:SCRIPT_ENTITY_NAME inManagedObjectContext:self.managedObjectContext];
	[self reloadData];
	[self.tableView reloadData];
}

- (void)reloadData {
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
		if (error != nil) {
			LOG_ERROR(@"Error when fetching scripts: %@", [error localizedDescription]);
		} else LOG_DEBUG(@"No scripts in database");
	}
}

#pragma mark - NSFetched Results Delegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	LOG_DEBUG(@"data did change");
	[self.tableView reloadData];
}

@end
