#import <Foundation/Foundation.h>


#define INSPECT_SCRIPT @"begin; (%@).inspect; rescue ScriptError, StandardError; 'Error: ' + ($! || 'exception raised'); end"


@interface EvalRuby : NSObject

+ (id)sharedInstance;

- (void)rubyInit;
- (NSString *)eval:(NSString *)code;

@end
