//
//  JKParentTableViewCell.m
//  ExpandTableView
//
//  Created by Jack Kwok on 7/5/13.
//  Copyright (c) 2013 Jack Kwok. All rights reserved.
//

#import "JKParentTableViewCell.h"

@implementation JKParentTableViewCell

@synthesize label, iconImage, selectionIndicatorImgView, parentIndex, selectionIndicatorImg;

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier; {
	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	[self setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
	[[self contentView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
	if (!self) {
		return self;
	}
	self.contentView.backgroundColor = [UIColor clearColor];

	self.selectionStyle = UITableViewCellSelectionStyleNone;

	self.iconImage = [[UIImageView alloc] initWithFrame:CGRectZero];
	// [self.iconImage setContentMode:UIViewContentModeCenter];
	[self.contentView addSubview:iconImage];

	self.label = [[UILabel alloc] initWithFrame:CGRectZero];
	label.backgroundColor = [UIColor clearColor];
	label.opaque = NO;
	label.textColor = [UIColor darkTextColor];
	label.textAlignment = NSTextAlignmentLeft;
	[self.contentView addSubview:label];

	self.selectionIndicatorImgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.selectionIndicatorImgView.contentMode = UIViewContentModeCenter;
    
	[self.contentView addSubview:selectionIndicatorImgView];
	[self setupImages];

	return self;
}

- (void)setupImages
{
	if (!self.selectionIndicatorImg) {
		self.selectionIndicatorImg = [UIImage imageNamed:@"filter-checkmark"];
	}
	if (!self.partialSelectionIndicatorImg) {
		self.partialSelectionIndicatorImg = [UIImage imageNamed:@"filter-partial"];
	}
	if (!self.noneSelectionIndicatorImg) {
		self.noneSelectionIndicatorImg = [UIImage imageNamed:@"filter-none"];
	}
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	[self setupDisplay];
}

- (void)setupDisplay
{
	CGRect contentRect = [self bounds];
	CGFloat contentAreaWidth = self.contentView.bounds.size.width;
	CGFloat contentAreaHeight = self.contentView.bounds.size.height;
	CGFloat checkMarkHeight = 0.0;
	CGFloat checkMarkWidth = 0.0;
	CGFloat iconHeight = 0.0;                     //  set this according to icon
	CGFloat iconWidth = 0.0;

	if (self.iconImage.image) {
		iconWidth = MIN(contentAreaWidth, self.iconImage.image.size.width);
		iconHeight = MIN(contentAreaHeight, self.iconImage.image.size.height);
	}


	UIImage *img = self.selectionIndicatorImgView.image;
	if (!img) {
		img = self.selectionIndicatorImg;
	}
	if (img) {
		checkMarkWidth = MIN(contentAreaWidth, img.size.width);
		checkMarkHeight = MIN(contentAreaHeight, img.size.height);
	}
    
	CGFloat sidePadding = 6.0;
	CGFloat icon2LabelPadding = 6.0;
	CGFloat checkMarkPadding = 16.0;
    
    checkMarkWidth += checkMarkPadding * 2;
    checkMarkHeight += checkMarkPadding * 2;
    
	[self.contentView setAutoresizesSubviews:YES];

	self.iconImage.frame = CGRectMake(sidePadding, (contentAreaHeight - iconHeight) / 2, iconWidth, iconHeight);
	CGFloat XOffset = iconWidth + sidePadding + icon2LabelPadding;

	CGFloat labelWidth = contentAreaWidth - XOffset - checkMarkWidth - checkMarkPadding;
	self.label.frame = CGRectMake(XOffset, 0, labelWidth, contentAreaHeight);
	// self.label.backgroundColor = [UIColor redColor];
	self.selectionIndicatorImgView.frame = CGRectMake(contentAreaWidth - checkMarkWidth,
													  (contentRect.size.height / 2) - (checkMarkHeight / 2),
													  checkMarkWidth,
													  checkMarkHeight);
}

- (void)rotateIconToExpanded
{
	[UIView beginAnimations:@"rotateDisclosure" context:nil];
	[UIView setAnimationDuration:0.2];
	iconImage.transform = CGAffineTransformMakeRotation(M_PI * 2.5);
	[UIView commitAnimations];
}

- (void)rotateIconToCollapsed
{
	[UIView beginAnimations:@"rotateDisclosure" context:nil];
	[UIView setAnimationDuration:0.2];
	iconImage.transform = CGAffineTransformMakeRotation(M_PI * 2);
	[UIView commitAnimations];
}

- (void)setSelectionIndicatorState:(JKExpandedTableSelectionIndicatorState)state
{
	if (state == JKExpandedTableSelectionIndicatorPartial && !self.displaysPartialSelectionIndicator) {
		state = JKExpandedTableSelectionIndicatorAll;
	}

	switch (state) {
		case JKExpandedTableSelectionIndicatorAll :
			self.selectionIndicatorImgView.image = self.selectionIndicatorImg;
			[self setNeedsLayout];
			break;
		case JKExpandedTableSelectionIndicatorPartial :
			self.selectionIndicatorImgView.image = self.partialSelectionIndicatorImg;
			[self setNeedsLayout];
			break;
		default :
			self.selectionIndicatorImgView.image = self.noneSelectionIndicatorImg;
			[self setNeedsLayout];
			break;
	}
}

- (void)setCellForegroundColor:(UIColor *)foregroundColor
{
	self.label.textColor = foregroundColor;
}

- (void)setCellBackgroundColor:(UIColor *)backgroundColor
{
	self.contentView.backgroundColor = backgroundColor;
}

@end