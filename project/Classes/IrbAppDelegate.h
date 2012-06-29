#import <UIKit/UIKit.h>

@class IrbViewController;

@interface IrbAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (retain) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

- (void)alertWithTitle:(NSString *)title andMessage:(NSString *)message;

@end

