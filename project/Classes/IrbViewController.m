
#import "IrbViewController.h"
#import "EvalRuby.h"
#import "UIButton+EasyTitle.h"


@implementation IrbViewController

@synthesize inputTextField, resultTextView;
@synthesize evalBtn;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.navigationItem.title = LOCALIZED_STRING(@"Quick Eval");
	self.evalBtn.title = LOCALIZED_STRING(@"eval");
}

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
