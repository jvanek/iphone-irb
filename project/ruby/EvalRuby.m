#import "EvalRuby.h"
#import "SharedInstance.h"
#import <iRuby/ruby.h>

static EvalRuby *sharedInstance;

@implementation EvalRuby

SHARED_INSTANCE_IMPL

- (void)rubyInit {
	ruby_init();
}


- (NSString*)eval:(NSString*)code {
#define INSPECT_SCRIPT @"begin; (%@).inspect; rescue ScriptError, StandardError; 'Error: ' + ($! || 'exception raised'); end"

	VALUE obj;
	int state;
	obj = rb_eval_string_protect([[NSString stringWithFormat:INSPECT_SCRIPT, code] UTF8String],
									&state);
	//rb_p(obj);
	
	NSString *result;
	if (state == 0) {
		result = [NSString stringWithCString:StringValuePtr(obj) 
										  encoding:NSUTF8StringEncoding];
	} else {
		result = @"exception raised"; 
	}
	return [NSString stringWithFormat:@"%@ #=>\n%@", code, result];
}

@end
