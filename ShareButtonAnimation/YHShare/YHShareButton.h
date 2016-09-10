//
//  YHShareButton.h
//  ShareButtonAnimation
//
//  Created by Gong_Youhao on 16/9/10.
//  Copyright © 2016年 Yoho Gong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YHShareButton : UIButton

/**
 *  collection布局 3 * 2
 *
 *  @param row        0~2
 *  @param column     0~1
 *  @param typeString buttonType
 *
 *  @return
 */
- (instancetype)initWithRow:(NSUInteger)row column:(NSUInteger)column typeString:(NSString *)typeString;

@end
