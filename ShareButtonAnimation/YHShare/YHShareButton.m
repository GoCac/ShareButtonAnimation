//
//  YHShareButton.m
//  ShareButtonAnimation
//
//  Created by Gong_Youhao on 16/9/10.
//  Copyright © 2016年 Yoho Gong. All rights reserved.
//

#import "YHShareButton.h"

static const CGFloat buttonWidth = 60.0;
static const CGFloat buttonHeight = 60.0;
static const CGFloat yOffsetForiPhone5 = 70.0;
static const CGFloat iPhone5Height = 1136.0;

/**
 *  Macro
 *
 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation YHShareButton

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
	}
	return self;
}

- (instancetype)initWithRow:(NSUInteger)row column:(NSUInteger)column typeString:(NSString *)typeString
{
	CGFloat offsetX = (SCREEN_WIDTH - buttonWidth * 3) / 4;
	CGFloat offsetY = yOffsetForiPhone5 / iPhone5Height * SCREEN_HEIGHT;
	CGFloat originX = offsetX + (buttonWidth + offsetX) * column;
	CGFloat originY = SCREEN_HEIGHT + (buttonHeight + offsetY) * row;

	self = [self initWithFrame:CGRectMake(originX, originY, buttonWidth, buttonHeight)];
	if (self) {
		UIImageView *buttonImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:typeString]];
		buttonImageView.layer.cornerRadius = buttonWidth / 2;
		buttonImageView.layer.masksToBounds = YES;
		[self addSubview:buttonImageView];
		self.layer.shadowColor = [UIColor blackColor].CGColor;
		self.layer.shadowOffset = CGSizeMake(0, 3);
		self.layer.shadowOpacity = 0.4f;
	}
	return self;
}

@end
