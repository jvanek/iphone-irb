#import <UIKit/UIKit.h>
#import "EvalRuby.h"
#import "IrbAppDelegate.h"

int main(int argc, char *argv[]) {
    @autoreleasepool {
		[[EvalRuby sharedInstance] rubyInit];
        int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([IrbAppDelegate class]));
        return retVal;
    }
}
