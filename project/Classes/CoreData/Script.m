//
//  Script.m
//  iphone-irb
//
//  Created by Vaněk Josef on 29/06/12.
//  Copyright (c) 2012 Intellicore. All rights reserved.
//

#import "Script.h"


@implementation Script

@dynamic title;
@dynamic content;
@dynamic creatDate;
@dynamic modifDate;

- (void)awakeFromInsert {
	[super awakeFromInsert];
	if (self.creatDate == nil) self.creatDate = [NSDate date];
	if (self.title == nil) self.title = LOCALIZED_STRING(@"Untitled");
}

@end
