#import <UIKit/UIKit.h>

@interface iphone_irbViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextView *resultTextView;
@property (nonatomic, strong) IBOutlet UITextField *inputTextField;

- (IBAction)onPushEval:(id)sender;

@end

