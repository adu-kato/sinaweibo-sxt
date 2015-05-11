//
//  WBBadgeButton.h
//  新浪微博-04主框架
//
//  Created by len on 15-5-8.
//  Copyright (c) 2015年 com.bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBBadgeButton : UIButton
@property(nonatomic,strong)NSString* badgeValue;
-(void)setPoint:(CGPoint)point;
@end
