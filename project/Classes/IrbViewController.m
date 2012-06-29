
#import "IrbViewController.h"
#import "EvalRuby.h"


@implementation IrbViewController

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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	[self onPushEval:nil];
	return YES;
}

@end
