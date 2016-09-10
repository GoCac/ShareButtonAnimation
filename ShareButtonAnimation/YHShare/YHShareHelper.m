//
//  YHShareHelper.m
//  ShareButtonAnimation
//
//  Created by Gong_Youhao on 16/9/10.
//  Copyright © 2016年 Yoho Gong. All rights reserved.
//

#import "YHShareButton.h"
#import "YHShareHelper.h"

static const CGFloat buttonHeight = 60.0;
static const CGFloat yOffsetForiPhone5 = 70.0;
static const CGFloat iPhone5Height = 1136.0;

/**
 *  Macro
 *
 */
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:(a)]
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation YHShareHelper

+ (void)shareWithViewController:(UIViewController *)viewController AndOtherParameters:(id)otherParameters
{
	UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
	backgroundView.backgroundColor = RGBACOLOR(0, 0, 0, 0.54);
	backgroundView.alpha = 0;
	UIView *keyWindow = [[UIApplication sharedApplication] keyWindow];
	[keyWindow addSubview:backgroundView];
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideShareViewWithTap:)];
	[backgroundView addGestureRecognizer:tap];

	YHShareButton *wechatButton = [[YHShareButton alloc] initWithRow:0 column:0 typeString:@"ShareWechat"];
	YHShareButton *momentButton = [[YHShareButton alloc] initWithRow:0 column:1 typeString:@"ShareMoments"];
	YHShareButton *weiboButton = [[YHShareButton alloc] initWithRow:0 column:2 typeString:@"ShareWeibo"];
	YHShareButton *qqButton = [[YHShareButton alloc] initWithRow:1 column:0 typeString:@"ShareQQ"];
	YHShareButton *copyLinkButton = [[YHShareButton alloc] initWithRow:1 column:1 typeString:@"ShareCopyLink"];
	wechatButton.tag = 400011;
	momentButton.tag = 400012;
	weiboButton.tag = 400013;
	qqButton.tag = 400021;
	copyLinkButton.tag = 400022;
	[backgroundView addSubview:wechatButton];
	[backgroundView addSubview:momentButton];
	[backgroundView addSubview:weiboButton];
	[backgroundView addSubview:qqButton];
	[backgroundView addSubview:copyLinkButton];

	CGFloat offsetY = yOffsetForiPhone5 / iPhone5Height * SCREEN_HEIGHT;
	CGFloat firstRowY = 370.0 / iPhone5Height * SCREEN_HEIGHT;
	CGFloat secondRowY = firstRowY + offsetY + buttonHeight;

	CGFloat duration = 0.6;
	CGFloat damping = 0.7;
	UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut;
	[UIView animateWithDuration:0.1
	                 animations:^{
		                 backgroundView.alpha = 1;
		             }];
	[UIView animateWithDuration:duration * (8.6 / 12)
	                      delay:0
	     usingSpringWithDamping:damping
	      initialSpringVelocity:0
	                    options:options
	                 animations:^{
		                 CGRect frame = momentButton.frame;
		                 frame.origin.y = firstRowY;
		                 momentButton.frame = frame;
		             }
	                 completion:nil];
	[UIView animateWithDuration:duration * (8.6 / 12)
	                      delay:0
	     usingSpringWithDamping:damping
	      initialSpringVelocity:0
	                    options:options
	                 animations:^{
		                 CGRect frame = copyLinkButton.frame;
		                 frame.origin.y = secondRowY;
		                 copyLinkButton.frame = frame;
		             }
	                 completion:nil];
	[UIView animateWithDuration:duration * (8.6 / 12)
	                      delay:duration * (1.1 / 12)
	     usingSpringWithDamping:damping
	      initialSpringVelocity:0
	                    options:options
	                 animations:^{
		                 CGRect frame = weiboButton.frame;
		                 frame.origin.y = firstRowY;
		                 weiboButton.frame = frame;
		             }
	                 completion:nil];
	[UIView animateWithDuration:duration * (8.6 / 12)
	                      delay:duration * (1.4 / 12)
	     usingSpringWithDamping:damping
	      initialSpringVelocity:0
	                    options:options
	                 animations:^{
		                 CGRect frame = wechatButton.frame;
		                 frame.origin.y = firstRowY;
		                 wechatButton.frame = frame;
		             }
	                 completion:nil];
	[UIView animateWithDuration:duration * (8.6 / 12)
	                      delay:duration * (1.4 / 12)
	     usingSpringWithDamping:damping
	      initialSpringVelocity:0
	                    options:options
	                 animations:^{
		                 CGRect frame = qqButton.frame;
		                 frame.origin.y = secondRowY;
		                 qqButton.frame = frame;
		             }
	                 completion:nil];
}

+ (void)hideShareViewWithTap:(UITapGestureRecognizer *)tap
{
	[self hideView:(UIView *)tap.view];
}

+ (void)hideView:(UIView *)backgroundView
{
	UIButton *wechatButton = (UIButton *)[backgroundView viewWithTag:400011];
	UIButton *momentButton = (UIButton *)[backgroundView viewWithTag:400012];
	UIButton *weiboButton = (UIButton *)[backgroundView viewWithTag:400013];
	UIButton *qqButton = (UIButton *)[backgroundView viewWithTag:400021];
	UIButton *copyLinkButton = (UIButton *)[backgroundView viewWithTag:400022];

	CGFloat offsetY = yOffsetForiPhone5 / iPhone5Height * SCREEN_HEIGHT;
	CGFloat firstRowY = 370.0 / iPhone5Height * SCREEN_HEIGHT;
	CGFloat secondRowY = firstRowY + offsetY + buttonHeight;

	float duration = 14.0;
	[UIView animateKeyframesWithDuration:duration / 20.0f
	    delay:0.0
	    options:UIViewKeyframeAnimationOptionCalculationModeCubic
	    animations:^{
		    [UIView addKeyframeWithRelativeStartTime:12 / duration
		                            relativeDuration:2 / duration
		                                  animations:^{
			                                  backgroundView.alpha = 0;
			                              }];
		    // momentButton
		    [UIView addKeyframeWithRelativeStartTime:0.0
		                            relativeDuration:7.5 / duration
		                                  animations:^{
			                                  CGRect frame;
			                                  frame = momentButton.frame;
			                                  frame.origin.y = firstRowY - 10;
			                                  momentButton.frame = frame;
			                              }];
		    [UIView addKeyframeWithRelativeStartTime:7.5 / duration
		                            relativeDuration:4.5 / duration
		                                  animations:^{
			                                  CGRect frame = momentButton.frame;
			                                  frame.origin.y = SCREEN_HEIGHT;
			                                  momentButton.frame = frame;
			                              }];
		    // copyLinkButton
		    [UIView addKeyframeWithRelativeStartTime:0.0
		                            relativeDuration:7.5 / duration
		                                  animations:^{
			                                  CGRect frame;
			                                  frame = copyLinkButton.frame;
			                                  frame.origin.y = secondRowY - 10;
			                                  copyLinkButton.frame = frame;
			                              }];
		    [UIView addKeyframeWithRelativeStartTime:7.5 / duration
		                            relativeDuration:4.5 / duration
		                                  animations:^{
			                                  CGRect frame = copyLinkButton.frame;
			                                  frame.origin.y = SCREEN_HEIGHT + offsetY + buttonHeight;
			                                  copyLinkButton.frame = frame;
			                              }];
		    // weiboButton
		    [UIView addKeyframeWithRelativeStartTime:0.35 / duration
		                            relativeDuration:7.5 / duration
		                                  animations:^{
			                                  CGRect frame;
			                                  frame = weiboButton.frame;
			                                  frame.origin.y = firstRowY - 10;
			                                  weiboButton.frame = frame;
			                              }];
		    [UIView addKeyframeWithRelativeStartTime:7.85 / duration
		                            relativeDuration:4.5 / duration
		                                  animations:^{
			                                  CGRect frame;
			                                  frame = weiboButton.frame;
			                                  frame.origin.y = SCREEN_HEIGHT;
			                                  weiboButton.frame = frame;
			                              }];
		    // wechatButton
		    [UIView addKeyframeWithRelativeStartTime:0.7 / duration
		                            relativeDuration:7.5 / duration
		                                  animations:^{
			                                  CGRect frame;
			                                  frame = wechatButton.frame;
			                                  frame.origin.y = firstRowY - 10;
			                                  wechatButton.frame = frame;
			                              }];
		    [UIView addKeyframeWithRelativeStartTime:8.2 / duration
		                            relativeDuration:4.5 / duration
		                                  animations:^{
			                                  CGRect frame;
			                                  frame = wechatButton.frame;
			                                  frame.origin.y = SCREEN_HEIGHT;
			                                  wechatButton.frame = frame;
			                              }];
		    // qqButton
		    [UIView addKeyframeWithRelativeStartTime:0.7 / duration
		                            relativeDuration:7.5 / duration
		                                  animations:^{
			                                  CGRect frame;
			                                  frame = qqButton.frame;
			                                  frame.origin.y = secondRowY - 10;
			                                  qqButton.frame = frame;
			                              }];
		    [UIView addKeyframeWithRelativeStartTime:8.2 / duration
		                            relativeDuration:4.5 / duration
		                                  animations:^{
			                                  CGRect frame;
			                                  frame = qqButton.frame;
			                                  frame.origin.y = SCREEN_HEIGHT + offsetY + buttonHeight;
			                                  qqButton.frame = frame;
			                              }];
		}
	    completion:^(BOOL finished) {
		    [backgroundView removeFromSuperview];
		}];
}

@end
