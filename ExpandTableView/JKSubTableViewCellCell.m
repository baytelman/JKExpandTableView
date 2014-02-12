//
//  JKSubTableViewCellCell.m
//  ExpandTableView
//
//  Created by Jack Kwok on 7/5/13.
//  Copyright (c) 2013 Jack Kwok. All rights reserved.
//

#import "JKSubTableViewCellCell.h"

@implementation JKSubTableViewCellCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [[self contentView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    if(!self)
        return self;
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.iconImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.iconImage];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.opaque = NO;
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.titleLabel];
    
    self.selectionOnIndicatorImg = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.selectionOnIndicatorImg];
    self.selectionOnIndicatorImg.contentMode = UIViewContentModeCenter;
    
    self.selectionOffIndicatorImg = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.selectionOffIndicatorImg];
    self.selectionOffIndicatorImg.contentMode = UIViewContentModeCenter;
    
    return self;
}

- (void) layoutSubviews {
    [super layoutSubviews];
    [self setupDisplay];
}

- (void) setupDisplay {
    CGRect contentRect = [self bounds];
    CGFloat contentAreaWidth = self.contentView.bounds.size.width;
    CGFloat contentAreaHeight = self.contentView.bounds.size.height;
    CGFloat checkMarkHeight = 0.0;
    CGFloat checkMarkWidth = 0.0;
    CGFloat iconHeight = 0.0; //  set this according to icon
    CGFloat iconWidth = 0.0;
    
    if (self.iconImage.image) {
        iconWidth = MIN(contentAreaWidth, self.iconImage.image.size.width);
        iconHeight = MIN(contentAreaHeight, self.iconImage.image.size.height);
    }
    if (self.selectionOnIndicatorImg.image) {
        checkMarkWidth = MIN(contentAreaWidth, self.selectionOnIndicatorImg.image.size.width);
        checkMarkHeight = MIN(contentAreaHeight, self.selectionOnIndicatorImg.image.size.height);
    }
    if (self.selectionOffIndicatorImg.image) {
        checkMarkWidth = MIN(contentAreaWidth, self.selectionOffIndicatorImg.image.size.width);
        checkMarkHeight = MIN(contentAreaHeight, self.selectionOffIndicatorImg.image.size.height);
    }
    
    CGFloat sidePadding = 22.0;
    
    if ([self.delegate respondsToSelector:@selector(indentForChildren)]) {
        CGFloat _delPad = [self.delegate indentForChildren];
        if (_delPad >= sidePadding) {
            sidePadding = _delPad;
        }
    }

    CGFloat icon2LabelPadding = 6.0;
    CGFloat checkMarkPadding = 16.0;
    
    checkMarkWidth += checkMarkPadding * 2;
    checkMarkHeight += checkMarkPadding * 2;
    
    [self.contentView setAutoresizesSubviews:YES];
    
    self.iconImage.frame = CGRectMake(sidePadding, (contentAreaHeight - iconHeight)/2, iconWidth, iconHeight);
    //self.iconImage.backgroundColor = [UIColor blueColor];
    
    CGFloat XOffset = iconWidth + sidePadding + icon2LabelPadding;
    
    CGFloat labelWidth = contentAreaWidth - XOffset - checkMarkWidth - checkMarkPadding;
    self.titleLabel.frame = CGRectMake(XOffset, 0, labelWidth, contentAreaHeight);

    //self.titleLabel.backgroundColor = [UIColor purpleColor];
    //self.selectionIndicatorImg.backgroundColor = [UIColor yellowColor];
    
    self.selectionOnIndicatorImg.frame = CGRectMake(contentAreaWidth - checkMarkWidth,
                                                  (contentRect.size.height/2)-(checkMarkHeight/2),
                                                  checkMarkWidth,
                                                  checkMarkHeight);
    self.selectionOffIndicatorImg.frame = self.selectionOnIndicatorImg.frame;
}

- (void)setCellForegroundColor:(UIColor *) foregroundColor {
    self.titleLabel.textColor = foregroundColor;
}

- (void)setCellBackgroundColor:(UIColor *) backgroundColor {
    self.contentView.backgroundColor = backgroundColor;
}


@end
