//
//  ScriptListViewCell.h
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Intellicore. All rights reserved.
//

#import "Script.h"

#define ScriptCellID			@"ScriptCellID"


@interface ScriptListViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *secondaryLabel;
@property (nonatomic, strong) Script *script;

- (void)updateWithScript:(Script *)aScript;

@end
