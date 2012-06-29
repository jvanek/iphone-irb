
#import "iphone_irbViewController.h"
#import "EvalRuby.h"


@implementation iphone_irbViewController

@synthesize inputTextField, resultTextView;

- (void)viewWillAppear:(BOOL)animated {
	[self.inputTextField becomeFirstResponder];
	self.resultTextView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
}

- (IBAction)onPushEval:(id)sender {
	NSString *s = [NSString stringWithFormat:@"%@\n%@", 
					[[EvalRuby sharedInstance] eval:self.inputTextField.text],
					self.resultTextView.text];
	self.resultTextView.text = s;
	self.inputTextField.text = @"";
}

@end
