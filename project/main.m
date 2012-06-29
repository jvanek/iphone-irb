#import <UIKit/UIKit.h>
#import "EvalRuby.h"

int main(int argc, char *argv[]) {
    
	[[EvalRuby sharedInstance] rubyInit];
	
    @autoreleasepool {
        int retVal = UIApplicationMain(argc, argv, nil, nil);
        return retVal;
    }
}
