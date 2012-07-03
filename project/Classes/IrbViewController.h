
#import <UIKit/UIKit.h>

@interface IrbViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UIBarButtonItem *evalBtn;
@property (nonatomic, strong) IBOutlet UITextView *resultTextView;
@property (nonatomic, strong) IBOutlet UITextField *inputTextField;

- (IBAction)onPushEval:(id)sender;

@end

