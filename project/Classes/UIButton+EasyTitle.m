//
//  UIButton+EasyTitle.m
//  iphone-irb
//
//  Created by Vaněk Josef on 03/07/12.
//  Copyright (c) 2012 Pallas Software. All rights reserved.
//

#import "UIButton+EasyTitle.h"

@implementation UIButton (EasyTitle)

- (void)setTitleForAllStates:(NSString *)title {
	[self setTitle:title forState:UIControlStateNormal];
	[self setTitle:title forState:UIControlStateSelected];
	[self setTitle:title forState:UIControlStateDisabled];
	[self setTitle:title forState:UIControlStateHighlighted];
}

@end
