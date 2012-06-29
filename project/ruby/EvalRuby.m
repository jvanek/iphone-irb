#import "EvalRuby.h"
#import <iRuby/ruby.h>


@interface EvalRuby()

- (void)setup;

@end


@implementation EvalRuby

+ (id)sharedInstance { 
    static dispatch_once_t pred = 0; 
    __strong static EvalRuby *_sharedDataObject = nil;
    dispatch_once(&pred, ^{
		_sharedDataObject = [self new];
		[_sharedDataObject setup];
    });	
    return _sharedDataObject;
}

- (void)setup {
	
}

- (void)rubyInit {
	ruby_init();
}

- (NSString*)eval:(NSString*)code {

	int state;
	VALUE obj = rb_eval_string_protect([[NSString stringWithFormat:INSPECT_SCRIPT, code] UTF8String], &state);
	//rb_p(obj);
	
	NSString *result = nil;
	if (state == 0) {
		result = [NSString stringWithCString:StringValuePtr(obj) encoding:NSUTF8StringEncoding];
	} else {
		result = @"exception raised"; 
	}
	return [NSString stringWithFormat:@"%@ #=>\n%@", code, result];
}

@end
