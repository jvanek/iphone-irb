#import "IrbAppDelegate.h"
#import "IrbViewController.h"


@interface IrbAppDelegate()
@property (nonatomic, retain) NSManagedObjectModel *managedObjectModel;
@end


@implementation IrbAppDelegate

@synthesize window = _window;
@synthesize managedObjectModel = _managedObjectModel, persistentStoreCoordinator, managedObjectContext = _managedObjectContext;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
	NSError		*error = nil;
	
	NSString *path = [NSString stringWithFormat:@"%@/IrbModel.sqlite", PATH_DOCUMENTS];	
	NSURL *storeUrl = [NSURL fileURLWithPath:path];
	
	NSAssert(storeUrl, @"storeUrl is nil !!!!");
	LOG_INFO(@"Using database at %@", [storeUrl path]);
	self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];	
	if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
												  configuration:nil
															URL:storeUrl
														options:nil
														  error:&error]) {
		
		NSString *lcErrorStr = [NSString stringWithFormat:@"%@:%@",[error localizedDescription],[error localizedFailureReason]];
		ALERT_ERROR(lcErrorStr);
	}
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	[USER_DEFAULTS synchronize];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	[USER_DEFAULTS synchronize];
	
	// Save all modifications
	NSError *error = nil;
	[self.managedObjectContext save:&error];
}

#pragma mark - Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *) managedObjectContext {
	
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
	
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created by merging all of the models found in the application bundle.
 */
- (NSManagedObjectModel *)managedObjectModel {
	
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }

	NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:@"IrbModel" withExtension:@"momd"];
	_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelUrl];
	
    return _managedObjectModel;
}


#pragma mark -
#pragma mark Allerts

/* Simple alert */
- (void)alertWithTitle:(NSString *)title andMessage:(NSString *)message {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
													message:message
												   delegate:nil
										  cancelButtonTitle:LOCALIZED_STRING(@"OK")
										  otherButtonTitles:nil];
	[alert show];
}

@end
