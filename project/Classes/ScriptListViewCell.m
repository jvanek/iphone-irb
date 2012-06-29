//
//  ScriptListViewCell.m
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Intellicore. All rights reserved.
//

#import "ScriptListViewCell.h"

@interface ScriptListViewCell()
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@end



@implementation ScriptListViewCell

@synthesize script, titleLabel, secondaryLabel;
@synthesize dateFormatter = _dateFormatter;

- (void)dealloc {
	self.script = nil;
	self.titleLabel = nil;
	self.secondaryLabel = nil;
	self.dateFormatter = nil;
}

- (NSDateFormatter *)dateFormatter {
	if (_dateFormatter == nil) {
		_dateFormatter = [[NSDateFormatter alloc] init];
		_dateFormatter.formatterBehavior = NSDateFormatterBehavior10_4;
		_dateFormatter.dateFormat = @"dd/MM/yyyy";
	}
	return _dateFormatter;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)updateWithScript:(Script *)aScript {
	self.script = aScript;
	self.titleLabel.text = aScript.title;
	if (aScript.modifDate != nil) self.secondaryLabel.text = [self.dateFormatter stringFromDate:aScript.modifDate];
	else self.secondaryLabel.text = LOCALIZED_STRING(@"New");
}

@end
