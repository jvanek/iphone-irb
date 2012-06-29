#import <UIKit/UIKit.h>
#import "EvalRuby.h"
#import "IrbAppDelegate.h"

int main(int argc, char *argv[]) {
    
	[[EvalRuby sharedInstance] rubyInit];
	
    @autoreleasepool {
        int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([IrbAppDelegate class]));
        return retVal;
    }
}
