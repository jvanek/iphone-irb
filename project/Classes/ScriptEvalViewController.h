//
//  ScriptEvalViewController.h
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Pallas Software. All rights reserved.
//

#import "Script.h"


@interface ScriptEvalViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextView *resultView;
@property (nonatomic, strong) Script *script;

@end
